//
// Copyright (c) 2013 Pantazis Deligiannis (p.deligiannis@imperial.ac.uk)
// This file is distributed under the MIT License. See LICENSE for details.
//

#include "llvm/Analysis/TargetLibraryInfo.h"
#include "llvm/Analysis/TargetTransformInfo.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/IR/Module.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/LinkAllPasses.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/FormattedStream.h"
#include "llvm/Support/ManagedStatic.h"
#include "llvm/Support/PrettyStackTrace.h"
#include "llvm/Support/Signals.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/TargetRegistry.h"
#include "llvm/Support/TargetSelect.h"
#include "llvm/Support/ToolOutputFile.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Target/TargetMachine.h"

#include "seadsa/Info.hh"

#include "smack/AddTiming.h"
#include "smack/BplFilePrinter.h"
#include "smack/CodifyStaticInits.h"
#include "smack/ExtractContracts.h"
#include "smack/InitializePasses.h"
#include "smack/IntegerOverflowChecker.h"
#include "smack/MemSafeMarker.h"
#include "smack/Naming.h"
#include "smack/NormalizeLoops.h"
#include "smack/RemoveDeadDefs.h"
#include "smack/RewriteBitwiseOps.h"
#include "smack/RustFixes.h"
#include "smack/SimplifyLibCalls.h"
#include "smack/SmackModuleGenerator.h"
#include "smack/SmackOptions.h"
#include "smack/SplitAggregateValue.h"
#include "smack/VerifierCodeMetadata.h"
#include "smack/sesl/verifier/MemSafeVerifier.h"
#include "smack/sesl/verifier/BMCMemSafeVerifier.h"
#include "smack/sesl/verifier/BMCCegarVerifier.h"
#include "smack/sesl/verifier/BMCMemSafeChecker.h"
#include "smack/sesl/witness/ViolationPathGen.h"

#include "utils/Devirt.h"
#include "utils/InitializePasses.h"
#include "utils/MergeGEP.h"
#include "utils/SimplifyExtractValue.h"
#include "utils/SimplifyInsertValue.h"

#define MIDDLE_PRINT 0

static llvm::cl::opt<std::string>
    InputFilename(llvm::cl::Positional,
                  llvm::cl::desc("<input LLVM bitcode file>"),
                  llvm::cl::Required, llvm::cl::value_desc("filename"));

static llvm::cl::opt<std::string>
    OriginFilePass("c", llvm::cl::desc("Input sourcecode file path"),
                    llvm::cl::init("FILE NAME"), llvm::cl::value_desc("filename"));

// Currently not added for witness syntax checking
// static llvm::cl::opt<std::string>
//     PropertyStr("prop", llvm::cl::desc("Input property file path"),
//                     llvm::cl::init("memsafety"), llvm::cl::value_desc("property string"));

static llvm::cl::opt<std::string>
    OutputFilename("bpl", llvm::cl::desc("Output Boogie filename"),
                   llvm::cl::init(""), llvm::cl::value_desc("filename"));

static llvm::cl::opt<std::string>
    FinalIrFilename("ll", llvm::cl::desc("Output the finally-used LLVM IR"),
                    llvm::cl::init(""), llvm::cl::value_desc("filename"));

static llvm::cl::opt<bool> StaticUnroll(
    "static-unroll",
    llvm::cl::desc("Use LLVM to statically unroll loops when possible"),
    llvm::cl::init(false));

static llvm::cl::opt<std::string> DefaultDataLayout(
    "default-data-layout",
    llvm::cl::desc("data layout string to use if not specified by module"),
    llvm::cl::init(""), llvm::cl::value_desc("layout-string"));

static llvm::cl::opt<bool> Modular(
    "modular",
    llvm::cl::desc("Enable contracts-based modular deductive verification"),
    llvm::cl::init(false));

std::string filenamePrefix(const std::string &str) {
  return str.substr(0, str.find_last_of("."));
}

#define DEBUG_TYPE "llvm2bpl"

namespace {
static void check(std::string E) {
  if (!E.empty()) {
    if (errs().has_colors())
      errs().changeColor(raw_ostream::RED);
    errs() << E << "\n";
    if (errs().has_colors())
      errs().resetColor();
    exit(1);
  }
}

// Returns the TargetMachine instance or zero if no triple is provided.
static TargetMachine *GetTargetMachine(Triple TheTriple, StringRef CPUStr,
                                       StringRef FeaturesStr,
                                       const TargetOptions &Options) {
  std::string Error;

  StringRef MArch;

  const Target *TheTarget =
      TargetRegistry::lookupTarget(MArch, TheTriple, Error);

  assert(TheTarget &&
         "If we don't have a target machine, can't do timing analysis");

  return TheTarget->createTargetMachine(
      TheTriple.getTriple(), CPUStr, FeaturesStr, Options,
      Reloc::Static,   /* was getRelocModel(),*/
      None,            /* Use default CodeModel */
      CodeGenOpt::None /*GetCodeGenOptLevel())*/
  );
}
} // namespace

int main(int argc, char **argv) {
  llvm::llvm_shutdown_obj shutdown; // calls llvm_shutdown() on exit
  llvm::cl::ParseCommandLineOptions(
      argc, argv, "llvm2bpl - LLVM bitcode to Boogie transformation\n");

  llvm::sys::PrintStackTraceOnErrorSignal(argv[0]);
  llvm::PrettyStackTraceProgram PSTP(argc, argv);
  llvm::EnableDebugBuffering = true;

  llvm::SMDiagnostic err;
  llvm::LLVMContext Context;

  InitializeAllTargets();
  InitializeAllTargetMCs();
  InitializeAllAsmPrinters();
  InitializeAllAsmParsers();

  std::unique_ptr<llvm::Module> module =
      llvm::parseIRFile(InputFilename, err, Context);
  if (!err.getMessage().empty())
    check("Problem reading input bitcode/IR: " + err.getMessage().str());

  auto &L = module.get()->getDataLayoutStr();
  if (L.empty())
    module.get()->setDataLayout(DefaultDataLayout);

  ///////////////////////////////
  // initialise and run passes //
  ///////////////////////////////

  std::vector<ToolOutputFile *> files;
  
  llvm::PassRegistry &Registry = *llvm::PassRegistry::getPassRegistry();
  llvm::initializeAnalysis(Registry);

  llvm::initializeCodifyStaticInitsPass(Registry);
  llvm::initializeDevirtualizePass(Registry);
  //llvm::initializeRemovePtrToIntPass(Registry);

  llvm::legacy::PassManager pass_manager;

  // This runs before DSA because some Rust functions cause problems.
  pass_manager.add(new smack::RustFixes);

  if (!Modular) {
    auto PreserveKeyGlobals = [=](const llvm::GlobalValue &GV) {
      std::string name = GV.getName();
      return smack::SmackOptions::isEntryPoint(name) ||
             smack::Naming::isSmackName(name) ||
             name.find("__VERIFIER_assume") != std::string::npos;
    };
    // internalize all functions and globals and preserve key globals
    pass_manager.add(llvm::createInternalizePass(PreserveKeyGlobals));
   
    // pass_manager.add(llvm::createGlobalDCEPass());
    // pass_manager.add(llvm::createDeadCodeEliminationPass());
    // pass_manager.add(llvm::createGlobalDCEPass());
    // pass_manager.add(llvm::createDeadCodeEliminationPass());
    //TODOsh: modify this pass for later verification
    //pass_manager.add(new smack::RemoveDeadDefs());
  }
  
  // pass_manager.add(seadsa::createRemovePtrToIntPass());
  pass_manager.add(llvm::createLowerSwitchPass());
  // pass_manager.add(llvm::createCFGSimplificationPass());
  // Shaobo: sea-dsa is inconsistent with the pass below.
  // pass_manager.add(llvm::createInternalizePass());
  pass_manager.add(llvm::createPromoteMemoryToRegisterPass());
  //StaticUnroll
  if (true) {
    pass_manager.add(llvm::createLoopSimplifyPass());
    pass_manager.add(llvm::createLoopRotatePass());
    // pass_manager.add(llvm::createIndVarSimplifyPass());
    //32767
    pass_manager.add(llvm::createLoopUnrollPass(3));
  }

  // pass_manager.add(new llvm::StructRet());
  pass_manager.add(new smack::NormalizeLoops());
  pass_manager.add(new llvm::SimplifyEV());
  pass_manager.add(new llvm::SimplifyIV());
  pass_manager.add(new smack::ExtractContracts());
  pass_manager.add(new smack::VerifierCodeMetadata());
  //TODOsh: commented, this may cause the malloc to disappear
  //pass_manager.add(llvm::createDeadCodeEliminationPass());
  pass_manager.add(smack::createCodifyStaticInitsPass());

  if (!Modular) {
    //pass_manager.add(new smack::RemoveDeadDefs());
  }
  pass_manager.add(new llvm::MergeArrayGEP());
  // pass_manager.add(new smack::SimplifyLibCalls());
  pass_manager.add(new llvm::Devirtualize());
  pass_manager.add(new smack::SplitAggregateValue());

  if (smack::SmackOptions::MemorySafety) {
    pass_manager.add(new smack::MemSafeMarker());
  }

  if (smack::SmackOptions::RewriteBitwiseOps &&
      !(smack::SmackOptions::BitPrecise ||
        smack::SmackOptions::BitPrecisePointers)) {
    pass_manager.add(new smack::RewriteBitwiseOps());
  }
  
  if (smack::SmackOptions::AddTiming) {
    Triple ModuleTriple(module->getTargetTriple());
    assert(
        ModuleTriple.getArch() &&
        "Module has no defined architecture: unable to add timing annotations");

    const TargetOptions Options;  /* = InitTargetOptionsFromCodeGenFlags();*/
    std::string CPUStr = "";      /*getCPUStr();*/
    std::string FeaturesStr = ""; /*getFeaturesStr();*/
    TargetMachine *Machine =
        GetTargetMachine(ModuleTriple, CPUStr, FeaturesStr, Options);

    assert(Machine &&
           "Module did not have a Target Machine: Cannot set up timing pass");
    // Add an appropriate TargetLibraryInfo pass for the module's triple.
    TargetLibraryInfoImpl TLII(ModuleTriple);
    pass_manager.add(new TargetLibraryInfoWrapperPass(TLII));

    // Add internal analysis passes from the target machine.
    pass_manager.add(
        createTargetTransformInfoWrapperPass(Machine->getTargetIRAnalysis()));
    pass_manager.add(new smack::AddTiming());
  }
  
  if (!FinalIrFilename.empty()) {
    std::error_code EC;
    auto F = new ToolOutputFile(FinalIrFilename.c_str(), EC, sys::fs::F_None);
    if (EC)
      check(EC.message());
    F->keep();
    files.push_back(F);
    pass_manager.add(llvm::createPrintModulePass(F->os()));
  }
  
  if (!OutputFilename.empty()) {
    std::error_code EC;
    auto F = new ToolOutputFile(OutputFilename.c_str(), EC, sys::fs::F_None);
    if (EC)
      check(EC.message());
    F->keep();
    files.push_back(F);

    pass_manager.add(new smack::SmackModuleGenerator());
    // TODOsh: add an argument to adjust the engine used
    // Symbolic Execution Engine
    // pass_manager.add(new smack::MemSafeVerifier());
    // pass_manager.add(new smack::ViolationPathGen(OriginFilePass));
    // BMC Verification Engine
    // pass_manager.add(new smack::BMCMemSafeVerifier());
    // BMC CEGAR Verification Engine
    // pass_manager.add(new smack::BMCCegarVerifier());
    // pass_manager.add(new smack::BplFilePrinter(F->os()));
    // BMC Checker - SLHV
    pass_manager.add(new smack::BMCMemSafeChecker());

  }

  pass_manager.run(*module.get());

  for (auto F : files)
    delete F;
  // Symbolic Heap Test:
  return 0;
}
