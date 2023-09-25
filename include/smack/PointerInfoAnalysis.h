//
// This file is distributed under the MIT License. See LICENSE for details.
//
#ifndef PONITERINFOANALYSIS_H
#define PONITERINFOANALYSIS_H

#include "llvm/Analysis/LoopInfo.h"
#include "llvm/IR/InstVisitor.h"

#include <iostream>
#include <set>
#include <unordered_set>
#include <map>
#include <memory>
#include <utility>
#include <vector>

namespace smack {

class Naming;

#define POINTER_TYPE_ANALYSIS_PRINT(Ty) \
  inline llvm::raw_ostream &operator<<(llvm::raw_ostream &OS, const Ty &T) { \
    T.print(OS); \
    return OS; \
  }

class PointerInfo {

private:
  std::string base;
  int field;
  std::string ptoTy;

public:
  PointerInfo() : base(""), field(0), ptoTy("") {}

  void setBase(std::string b) { base = b; }
  void setField(int f) { field = f; }
  void setPtoTy(std::string t) { ptoTy = t; }

  std::string getBase() { return base; }
  int getField() { return field; }
  std::string getPtoTy() { return ptoTy; }

  void show() {
    std::cout << " Base : " << base << ", Field : " << field
      << " ---> Pto Type : " << ptoTy;
  }

  void print(llvm::raw_ostream& OS) const {
    OS << " Base : " << base << ", Field : " << field
      << " ---> Pto Type : " << ptoTy;
  }
};

POINTER_TYPE_ANALYSIS_PRINT(PointerInfo)

class PointerInfoManager {

private:
  std::map<std::string, PointerInfo> pointerTypes;

public:
  PointerInfoManager() : pointerTypes() {}

  void add(std::string var, PointerInfo pi) {
    pointerTypes[var] = pi;
  }

  void update(std::string var, PointerInfo pi) {
    assert(contains(var));
    pointerTypes[var] = pi;
  }

  bool contains(std::string var) {
    return pointerTypes.find(var) != pointerTypes.end();
  }

  PointerInfo get(std::string var) {
    if (!this->contains(var)) return PointerInfo();
    return pointerTypes[var];
  }

  // TODO

  void show() {
    for (auto vp : pointerTypes) {
      std::cout << vp.first << " --> ";
      vp.second.show();
    }
  }

  void print(llvm::raw_ostream& OS) const {
    for (auto vp : pointerTypes) {
      OS << vp.first << " --> " << vp.second << '\n';
    }
  }
};

POINTER_TYPE_ANALYSIS_PRINT(PointerInfoManager)

typedef std::set<std::string> PointerEq;

class PointerEqManager {

private:
  int Id;
  std::map<std::string, int> idx;
  std::vector<PointerEq> pointerEqs;

public:
  PointerEqManager() : Id(0), idx(), pointerEqs() {}

  void add(std::string& pt) {
    if (idx.find(pt) != idx.end()) return;
    idx[pt] = Id++;
    pointerEqs.push_back(PointerEq());
    pointerEqs.back().insert(pt);
  }

  void setEq(std::string& b, std::string& n) {
    if (idx.find(b) == idx.end()) this->add(b);
    idx[n] = idx[b];
    pointerEqs[idx[b]].insert(n);
  }

  bool contains(std::string& pt) {
    return idx.find(pt) != idx.end();
  }

  PointerEq getEq(std::string pn) {
    assert(contains(pn));
    return pointerEqs[idx[pn]];
  }

};

typedef std::map<std::string, int> StructSet;

class PointerInfoAnalysis
  : public llvm::InstVisitor<PointerInfoAnalysis> {

private:
  Naming* naming;
  std::shared_ptr<StructSet> structs;
  std::shared_ptr<PointerInfoManager> pim;
  
  std::shared_ptr<PointerEqManager> pem;

  std::string getPtoTy(llvm::Type* lt);
  bool isStruct(std::string& ty);
  bool isStructPt(llvm::Type* lt);

public:
  PointerInfoAnalysis(
    Naming *N,
    std::shared_ptr<StructSet> s,
    std::shared_ptr<PointerInfoManager> pim)
    : naming(N), structs(s), pim(pim), pem(new PointerEqManager()) {}

  void visitInstruction(llvm::Instruction &I);

  void visitAllocaInst(llvm::AllocaInst &I);
  void visitBitCastInst(llvm::BitCastInst &I);
  void visitCallInst(llvm::CallInst &I);
  void visitLoadInst(llvm::LoadInst &I);
  void visitGetElementPtrInst(llvm::GetElementPtrInst &I);

  void print(llvm::raw_ostream& OS) const { pim->print(OS); }

};

POINTER_TYPE_ANALYSIS_PRINT(PointerInfoAnalysis)

} // namespace smack

#endif 