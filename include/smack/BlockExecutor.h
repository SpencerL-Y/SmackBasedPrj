#ifndef BLOCKEXECUTOR_H
#define BLOCKEXECUTOR_H
#include <z3++.h>

#include <utility>
#include "BoogieAst.h"
#include "llvm/IR/DebugInfo.h"
#include "smack/AddTiming.h"
#include "smack/Debug.h"
#include "smack/BoogieAst.h"
#include "smack/VarEquiv.h"
#include "smack/VarFactory.h"

// This object is for dealing with symbolic execution
// of symbolic heap at frontend
namespace smack{
    using llvm::errs;
    class BlockExecutor {
        Program* program;
        Block* currentBlock;
        VarEquivPtr varEquiv;
        VarFactoryPtr varFactory;

        // funcexpr name judgement functions
        bool isAssignFuncName(std::string name);
        bool isPtrCastFuncName(std::string name);


    public:
        BlockExecutor(Program* p, Block* cb, VarEquivPtr vars, VarFactoryPtr vf) : program(p), currentBlock(cb), varEquiv(vars), varFactory(vf) {}

        SHExprPtr executeAssign(SHExprPtr sh, const Stmt* stmt);
        SHExprPtr executeCall(SHExprPtr sh, const Stmt* callstmt);

        SHExprPtr executeMalloc(SHExprPtr sh, const CallStmt* stmt);

        SHExprPtr executeFree(SHExprPtr sh, const CallStmt* stmt);

        SHExprPtr executeCast(SHExprPtr sh, const Stmt* stmt);

        SHExprPtr executeOther(SHExprPtr sh, const Stmt* stmt);

        // symbolic execution for current block and results in and symbolic heap.
        SHExprPtr execute(SHExprPtr initialSh, const Stmt* stmt);


        Block* getBlock(){ return currentBlock; }
        void setBlock(Block* block){ currentBlock = block; }
        VarEquivPtr getVarEquiv() { return varEquiv;}
        VarFactoryPtr getVarFactory() { return varFactory;}


    };
    typedef std::shared_ptr<BlockExecutor> BlockExecutorPtr;
}


#endif