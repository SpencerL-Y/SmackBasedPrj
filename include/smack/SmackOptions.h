//
// This file is distributed under the MIT License. See LICENSE for details.
//

#ifndef SMACKOPTIONS_H
#define SMACKOPTIONS_H

#include "llvm/Support/CommandLine.h"

#include "smack/SmackWarnings.h"

namespace smack {
enum class LLVMAssumeType { none, use, check };

class SmackOptions {
public:
  static const llvm::cl::list<std::string> EntryPoints;

  static const llvm::cl::opt<SmackWarnings::WarningLevel> WarningLevel;
  static const llvm::cl::opt<bool> ColoredWarnings;

  static const llvm::cl::opt<bool> MemoryModelDebug;
  static const llvm::cl::opt<bool> MemoryModelImpls;

  static const llvm::cl::opt<bool> SourceLocSymbols;
  static llvm::cl::opt<bool> BitPrecise;
  static const llvm::cl::opt<bool> BitPrecisePointers;
  static const llvm::cl::opt<bool> RewriteBitwiseOps;
  static const llvm::cl::opt<bool> NoMemoryRegionSplitting;
  static const llvm::cl::opt<bool> NoByteAccessInference;
  static const llvm::cl::opt<bool> FloatEnabled;
  static const llvm::cl::opt<bool> MemorySafety;
  static const llvm::cl::opt<bool> IntegerOverflow;
  static const llvm::cl::opt<LLVMAssumeType> LLVMAssumes;
  static const llvm::cl::opt<bool> RustPanics;
  static const llvm::cl::opt<bool> AddTiming;
  static const llvm::cl::opt<bool> WrappedIntegerEncoding;
  static const llvm::cl::opt<bool> SymbolicHeapMemoryLeak;
  static const llvm::cl::opt<bool> AddLineInfo; //used to find corresponding source code from boogie
  static const llvm::cl::opt<bool> bw64;
  static const llvm::cl::opt<bool> bw32;
  static bool isEntryPoint(std::string);
};
} // namespace smack

#endif // SMACKREP_H
