#ifndef __SEADSA_NAME_VALUES__HPP_
#define __SEADSA_NAME_VALUES__HPP_

#include "llvm/ADT/StringRef.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Module.h"
#include "llvm/Pass.h"

namespace seadsa {
struct NameValues : public llvm::ModulePass {
  static char ID;
  NameValues() : llvm::ModulePass(ID) {}
  bool runOnModule(llvm::Module &M);
  bool runOnFunction(llvm::Function &F);
  void getAnalysisUsage(llvm::AnalysisUsage &AU) const { AU.setPreservesAll(); }
  virtual llvm::StringRef getPassName() const {
    return "sea-dsa: names all unnamed values";
  }
};
} // namespace seadsa

#endif
