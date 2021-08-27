#ifndef BLOCKEXECUTOR_H
#define BLOCKEXECUTOR_H
#include <z3++.h>

#include <utility>
#include <regex>
#include <string>
#include "BoogieAst.h"
#include "llvm/IR/DebugInfo.h"
#include "smack/AddTiming.h"
#include "smack/Debug.h"
#include "smack/BoogieAst.h"
#include "smack/ExecutionState.h"
#include "smack/VarEquiv.h"
#include "smack/VarFactory.h"
#include "smack/StoreSplitter.h"
#include "smack/cfg/CFG.h"
#include "smack/SVNaming.h"
#include "utils/CenterDebug.h"

// This object is for dealing with symbolic execution
// of symbolic heap at frontend

// About pointer arithmetic: currently support the pointer arithmetic of the form:
// p = p + c 
// where p is of pointer variable type and c is a constant

namespace smack{
    using llvm::errs;
    enum VarType {
        PTR,
        DATA
    };

    class BlockExecutor {

        // An abstract state for execution includes:
        // (p,SHExprPtr)
        // auxillary information: varEquiv, varFactory and storeSplit

        Program* program;
        Block* currentBlock;
        VarEquivPtr varEquiv;
        VarFactoryPtr varFactory;
        StoreSplitterPtr storeSplit;
        CFGPtr cfg;

        // var string judgement
        bool isPtrVar(std::string name);

        // funcexpr name judgement functions
        bool isUnaryAssignFuncName(std::string name);
        bool isUnaryPtrCastFuncName(std::string name);
        bool isUnaryBooleanFuncName(std::string name);
        bool isBinaryBooleanFuncName(std::string name);
        bool isBinaryArithFuncName(std::string name);
        bool isStoreLoadFuncName(std::string name);
        bool isPtrArithFuncName(std::string name);

        const Expr* parsePtrArithmeticExpr(const Expr* arithExpr, std::string lhsName);
        const Expr* parseVarArithmeticExpr(const Expr* arithExpr);
        // compute expression according to the operator types
        const Expr* computeBinaryArithmeticExpr(std::string name, const Expr* left, const Expr* right);
        
        int computeArithmeticOffsetValue(const Expr* expression);
        const Expr* parseUnaryBooleanExpression(std::string funcName, const Expr* inner);
        const Expr* parseBinaryBooleanExpression(std::string funcName, const Expr* lhs, const Expr* rhs);
        const Expr* extractPtrArithVarName(const Expr* expression);
        int parsePtrArithmeticStepSize(const Expr* expression);


        const Expr* parseCondition(const Expr* cond);


        // Utils for store execution
        int extractStoreFuncSize(std::string funcName);

    public:
        BlockExecutor(Program* p, CFGPtr cfgPtr, StatePtr cb) : program(p), cfg(cfgPtr) {this->setBlock(cb); this->cfg->addVarType("$Null", "i64");}

        // --------------------- Execution for initialization
        SHExprPtr executeGlobal(SHExprPtr sh);
        // --------------------- Execution for instructions

        SHExprPtr executeAssign(SHExprPtr sh, const Stmt* stmt);

        SHExprPtr executeAssume(SHExprPtr sh, const Stmt* stmt);

        SHExprPtr executeCall(SHExprPtr sh, const Stmt* callstmt);

        SHExprPtr executeMalloc(SHExprPtr sh, const CallStmt* stmt);

        SHExprPtr executeAlloc(SHExprPtr sh, const CallStmt* stmt);

        SHExprPtr executeFree(SHExprPtr sh, const CallStmt* stmt);

        SHExprPtr executeVeriCall(SHExprPtr sh, const CallStmt* stmt);

        SHExprPtr executeUnintepreted(SHExprPtr sh, const CallStmt* stmt);

        SHExprPtr executeCast(SHExprPtr sh, const Stmt* stmt);

        SHExprPtr executeLoad(SHExprPtr sh, std::string lhsVarName, std::string lhsVarOrigName, const FunExpr* rhsFun);

        SHExprPtr executeStore(SHExprPtr sh, const FunExpr* rhsFun);

        SHExprPtr executeOther(SHExprPtr sh, const Stmt* stmt);

        //----------------------- Execution for library functions


        SHExprPtr executeMemcpy(SHExprPtr sh, const FunExpr* rhsFun);

        SHExprPtr executeMemset(SHExprPtr sh, const FunExpr* rhsFun);



        // symbolic execution for current stmt and results in and symbolic heap.
        SHExprPtr executeStmt(SHExprPtr initialSh, const Stmt* stmt);
        std::pair<ExecutionStatePtr, StatementList> execute(ExecutionStatePtr previousExecState);
        ExecutionStatePtr initializeExec(ExecutionStatePtr initialExecState);



        // ------------------ Execution Utilities
        VarType getVarType(std::string varName);
        int getBitwidthOfDataVar(std::string varName);
        int getStepSizeOfPtrVar(std::string varName);
        std::pair<const VarExpr*, std::string> getUsedVarAndName(std::string origVarName);
        std::pair<const Expr*, bool> getUsedArithExprAndVar(const VarExpr* lhsVar, const Expr* originExpr);
        void setDataVarBitwidth(std::string varName, int bitWidth);
        void setPtrVarStepSize(std::string varName, int stepSize);
        void updateVarType(const VarExpr* lhsVar, const Expr* rhs, int storedSize);
        void updateExecStateEqualVarAndRhsVar(const VarExpr* lhsVar, const Expr* rhsVar);
        void updateExecStateEqualVarAndRhsValue(const VarExpr* lhsVar, const Expr* rhsVal);
        void updateExecStateEqualVarAndRhsArithExpr(const VarExpr* lhsVar, const Expr* rhsExpr, const Expr* storedExpr, bool isPtr);


        Block* getBlock(){ return currentBlock; }
        void setBlock(StatePtr cb){ currentBlock = cb->getStateBlock(); }
        VarEquivPtr getVarEquiv() { return varEquiv;}
        VarFactoryPtr getVarFactory() { return varFactory;}
        StoreSplitterPtr getStoreSplit() { return storeSplit;}


    };
    typedef std::shared_ptr<BlockExecutor> BlockExecutorPtr;

    
}


#endif