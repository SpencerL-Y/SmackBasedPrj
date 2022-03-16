// Author: Xie Li
// Institute: ISCAS
// 24/2/2022

#include "smack/sesl/bmc/BMCRefinedCFG.h"
#include "smack/sesl/bmc/StmtFormatter.h"
#include <iostream>

namespace smack
{
    ConcreteAction::ConcreteAction(const Stmt* s) {
        this->stmt = s;
        //TODO: need to extract the argument of the instruction for later use (or implement  a function for the extraction).
        if(s == nullptr){
            this->actType = ActType::NULLSTMT;
        } else {
                if(s->getKind() == Stmt::Kind::ASSERT){
                this->actType = ActType::ASSERT;
            } else if(s->getKind() == Stmt::Kind::ASSIGN){
                // deal with load, store and common assignments here
                const AssignStmt* ass = (const AssignStmt*) s;
                if(ass->getLhs().size() > 1){
                    BMCDEBUG(std::cout << "WARNING: current cannot resolve actions with stmt number > 1." << std::endl;);
                } else {
                    const Expr* lhs = ass->getLhs().front();
                    const Expr* rhs = ass->getRhs().front();
                    if(rhs->getType() == ExprType::FUNC){
                        const FunExpr* funcExpr  =(const FunExpr*) rhs;
                        if(funcExpr->name().find("$load") != std::string::npos){
                            this->actType = ActType::LOAD; 
                        } else if(funcExpr->name().find("$store") != std::string::npos){
                            this->actType = ActType::STORE;
                        } else {
                            this->actType = ActType::COMMONASSIGN;
                        }
                    } else {
                        this->actType = ActType::COMMONASSIGN;
                    }
                }
            } else if(s->getKind() == Stmt::Kind::ASSUME){
                this->actType = ActType::ASSUME;
            } else if(s->getKind() == Stmt::Kind::CALL){
                // deal with malloc, free here
                const CallStmt* callStmt = (const CallStmt*) s;
                if(callStmt->getProc().find("malloc") != std::string::npos){
                    this->actType = ActType::MALLOC; 
                } else if(callStmt->getProc().find("free") != std::string::npos){
                    this->actType = ActType::FREE;
                } else {
                    this->actType = ActType::OTHERPROC;
                }
            } else if(s->getKind() == Stmt::Kind::RETURN){
                this->actType = ActType::OTHER;
            } else {
                BMCDEBUG(std::cout << "WARNING: Stmt Kind parsing not support: " << s->getKind() << std::endl;);
                this->actType = ActType::OTHER;
            }
        }
    }


    void  ConcreteAction::printActType(ConcreteAction::ActType actType){
        if(actType == ActType::ASSERT){
            std::cout << "ASSERT\t";
        } else if(actType == ActType::ASSUME){
            std::cout << "ASSUME\t";
        } else if(actType == ActType::COMMONASSIGN){
            std::cout << "ASSIGN\t";
        } else if(actType == ActType::FREE){
            std::cout << "FREE\t";
        } else if(actType == ActType::LOAD){
            std::cout << "LOAD\t";
        } else if(actType == ActType::MALLOC){
            std::cout << "MALLOC\t";
        } else if(actType == ActType::OTHER){
            std::cout << "OTHER\t";
        } else if(actType == ActType::OTHERPROC){
            std::cout << "OTPROC\t";
        } else if(actType == ActType::STORE){
            std::cout << "STORE\t";
        }
    }

    ConcreteEdge::ConcreteEdge(int from, int to, const Stmt* s, int id) {
        this->fromVertex = from;
        this->toVertex = to;
        this->edgeId = id;
        // TODO: create action for the edge
        ConcreteActionPtr newAction = std::make_shared<ConcreteAction>(s);
        this->action = newAction;
    }

    void ConcreteEdge::print(){
        std::cout << "INFO: [Edge " + std::to_string(this->fromVertex) + " --> " + std::to_string(this->toVertex) + "] " << std::endl;
        if(this->action->getStmt() != nullptr){
            this->action->getStmt()->print(std::cout);
        } else {
            std::cout << "<null>";;
        }
        std::cout << std::endl; 
    }

    ConcreteCFG::ConcreteCFG(CFGPtr origCfg) {
        // Construct the concrete cfg from original one
        this->vertexNum = 0;
        this->edgeNum = 0;
        this->origCfg = origCfg;
        int vertexId = 0;
        int edgeId = 0;
        for(StatePtr statePtr : origCfg->getStates()){
            BMCDEBUG(std::cout << "INFO: Begin translating state: " << statePtr->getBlockName() << std::endl;);

            vertexId += 1;
            this->vertexNum += 1;
            StatementList origStateStmts = statePtr->getStateBlock()->getStatements();
            
            std::string entryName = statePtr->getBlockName() + "_entry";
            this->nameToConcreteState[entryName] = vertexId;

            for(const Stmt* stmt : origStateStmts){
                int newvertexId = vertexId +1;
                ConcreteEdgePtr edge = std::make_shared<ConcreteEdge>(vertexId, newvertexId, stmt, edgeId);
                this->concreteEdges.push_back(edge);
                vertexId = newvertexId;
                this->vertexNum += 1;
                edgeId += 1;
                this->edgeNum += 1;
            }

            std::string exitName = statePtr->getBlockName() + "_exit";
            this->nameToConcreteState[exitName] = vertexId;
        }
        
        for(StatePtr statePtr : origCfg->getStates()){
            for(auto destEdgePair : statePtr->getEdges()){
                std::string fromBlockName = statePtr->getBlockName();
                std::string fromKey = fromBlockName + "_exit";
                std::string toBlockName = destEdgePair.first;
                std::string toKey = toBlockName + "_entry";
                int from = this->nameToConcreteState[fromKey];
                int to = this->nameToConcreteState[toKey];
                const Stmt* actionStmt = destEdgePair.second->getGuard().getStmt();
                ConcreteEdgePtr edge = std::make_shared<ConcreteEdge>(from, to, actionStmt, edgeId);
                edgeId += 1;
                this->concreteEdges.push_back(edge);
            }    
        }
    }

    void ConcreteCFG::printConcreteCFG() {
        std::cout << "INFO: -------------- Print Concrete CFG" << std::endl;
        std::cout << "INFO: ----------- Num of Vertices: " << this->vertexNum << std::endl;
        std::cout << "INFO: -----------  Edges: " << std::endl;
        for(ConcreteEdgePtr edge : this->concreteEdges){
            edge->print();
        }
        std::cout << "INFO: ----------- VarTypes: " << std::endl;
        for(auto varTypePair : this->origCfg->getVarTypes()){
            std::cout << varTypePair.first + " " + varTypePair.second << std::endl;
        }
        std::cout << std::endl;
    }

    void RefinedAction::print(){
        std::cout << "RefinedAction: ";
        ConcreteAction::printActType(this->getActType());
        std::cout << " ARG1: ";
        if(this->arg1 != nullptr){
            this->arg1->print(std::cout);
            std::cout << "(" << this->type1 << ") " << std::endl;
        } else {
            std::cout << " <NULL>";
        }

        std::cout << " ARG2: ";
        if(this->arg2 != nullptr){
            this->arg2->print(std::cout);
            std::cout << "(" << this->type2 << ") " << std::endl;
        } else {
            std::cout << " <NULL>";
        }

        std::cout << " ARG3: ";
        if(this->arg3 != nullptr){
            this->arg3->print(std::cout);
            std::cout << "(" << this->type3 << ") " << std::endl;
        } else {
            std::cout << " <NULL>";
        }

        std::cout << " ARG4: ";
        if(this->arg4 != nullptr){
            this->arg4->print(std::cout);
            std::cout << "(" << this->type4 << ") " << std::endl;
        } else {
            std::cout << " <NULL>";
        }
        std::cout << std::endl;
    }

    void RefinedEdge::print(){
        std::cout << "INFO: [Edge] " << this->getFrom() << " ---> " << this->getTo() << std::endl;
        std::cout << "INFO: [Actions]" << std::endl;
        for(RefinedActionPtr act : this->refinedActions){
            act->print();
        }
    }

    BMCRefinedCFG::BMCRefinedCFG(ConcreteCFGPtr conCfg){
        StmtFormatterPtr formatter = std::make_shared<StmtFormatter>(conCfg->getOrigCfg());
        // TODObmc: this should be problematic since variables appears not only restricts in the cfg vars, but also constDecls
        this->vertexNum = conCfg->getVertexNum();
        this->edgeNum = conCfg->getEdgeNum();
        this->origCfg = conCfg->getOrigCfg();
        std::map<int, bool> tempFinalVertices;
        std::map<int, bool> tempInitVertices;
        for(int vertexId = 1; vertexId <= this->vertexNum; vertexId++){
            tempFinalVertices[vertexId] = true;
            tempInitVertices[vertexId] = true;
        }
        for(ConcreteEdgePtr conEdge : conCfg->getConcreteEdges()){
            RefinedEdgePtr refinedEdge = formatter->convert(conEdge);
            this->refinedEdges.push_back(refinedEdge);
            this->edge2IdMap[refinedEdge] = refinedEdge->getEdgeId();
            tempFinalVertices[refinedEdge->getFrom()] = false;
            tempInitVertices[refinedEdge->getTo()] = false;
        }
        // sort out the final and init vertices
        for(std::pair<int, bool> finalPair : tempFinalVertices){
            if(finalPair.second){
                this->finalVertices.insert(finalPair.first);
            }
        }
        for(std::pair<int, bool> initPair : tempInitVertices){
            if(initPair.second){
                this->initVertices.insert(initPair.first);
            }
        }
        // add self loops for the final vertices
        for(int finalId : this->finalVertices){
            int currentEdgeId = this->edgeNum;
            std::vector<RefinedActionPtr> emptyActions;
            RefinedEdgePtr selfLoop = std::make_shared<RefinedEdge>(emptyActions, finalId, finalId, currentEdgeId);
            this->edge2IdMap[selfLoop] = currentEdgeId;
            this->refinedEdges.push_back(selfLoop);
            currentEdgeId += 1;
            this->edgeNum += 1;
        }
    }   


    std::list<RefinedEdgePtr> BMCRefinedCFG::getEdgesStartFrom(int fromVertex){
        assert(fromVertex > 0 && fromVertex <= this->vertexNum);
        std::list<RefinedEdgePtr> startEdges;
        for(RefinedEdgePtr edge : this->refinedEdges){
            if(edge->getFrom() == fromVertex){
                startEdges.push_back(edge);
            }
        }
        return startEdges;
    }

    std::list<RefinedEdgePtr> BMCRefinedCFG::getEdgesEndWith(int toVertex){
        assert(toVertex > 0 && toVertex <= this->vertexNum);
        std::list<RefinedEdgePtr> toEdges;
        for(RefinedEdgePtr edge : this->refinedEdges){
            if(edge->getTo() == toVertex){
                toEdges.push_back(edge);
            }
        }
        return toEdges;
    }

    int BMCRefinedCFG::mapEdge2Id(RefinedEdgePtr edge){
        if(this->edge2IdMap.find(edge) != this->edge2IdMap.end()){
            return this->edge2IdMap[edge];
        } else {
            BMCDEBUG(std::cout << "ERROR: edge does not exist in BMCRefinedCFG" << std::endl;);
            assert(false);
            return -1;
        }
    }
    
    bool BMCRefinedCFG::isInitVertex(int vertexId){
        if(this->initVertices.find(vertexId) != this->initVertices.end()){
            return true;
        } else {
            return false;
        }
    }

    bool BMCRefinedCFG::isFinalVertex(int vertexId){
        if(this->finalVertices.find(vertexId) != this->finalVertices.end()){
            return true;
        } else {
            return false;
        }
    }
    
    std::map<int, int> BMCRefinedCFG::computeSccMap(){
        std::map<int, std::pair<int, int>> computeTable;
        std::map<int, int> sccResult;
        this->sccNum = 0;
        this->sccId = 0;
        for(int i = 1; i <= this->vertexNum; i++){
            computeTable[i] = {-1, -1};
        }
        std::list<int> emptyStack;
        for(int v = 1; v <= this->vertexNum; v++){
            if(computeTable[v].second == -1){
                this->tarjanScc(v, computeTable, emptyStack, sccResult);
            }
        }
        // std::cout << "SCC Result: " << std::endl;
        // for(auto i : computeTable){
        //     std::cout << i.first << " " << i.second.first << "," << i.second.second << std::endl;
        // }
        return sccResult;
    }

    bool listHas(std::list<int>& currStack, int elem){
        for(int i : currStack){
            if(elem == i){
                return true;
            }
        }
        return false;
    }

    void BMCRefinedCFG::tarjanScc(int curr, std::map<int, std::pair<int, int>>& currentMap, std::list<int>& currStack, std::map<int, int>& sccResult){
        currentMap[curr].second = this->sccNum;
        currentMap[curr].first = this->sccNum;
        this->sccNum += 1;
        currStack.push_back(curr);
        for(RefinedEdgePtr edge : this->refinedEdges){
            if(edge->getFrom() == curr){
                if(currentMap[edge->getTo()].second == -1){
                    this->tarjanScc(edge->getTo(), currentMap, currStack, sccResult);
                    currentMap[curr] = {
                        std::min(
                            currentMap[curr].first,
                            currentMap[edge->getTo()].first
                        ), 
                        currentMap[curr].second
                    };
                } else if(listHas(currStack, edge->getTo())){
                    currentMap[curr] = {
                        std::min(
                            currentMap[curr].first,
                            currentMap[edge->getTo()].second
                        ),
                        currentMap[curr].second
                    };
                }
            }
        }

        if(currentMap[curr].first == currentMap[curr].second){
            this->sccId += 1;
            while(currStack.back() != curr){
                sccResult[currStack.back()] = this->sccId;
                currStack.pop_back();
            }
            sccResult[curr] = this->sccId;
            currStack.pop_back();
        }
    }

    void BMCRefinedCFG::printRefinedCFG(){
        std::cout << "INFO: -------------- Print Refined CFG" << std::endl;
        std::cout << "INFO: ----------- Num of Vertices: " << this->vertexNum << std::endl;
        std::cout << "INFO: -----------  Edges: " << std::endl;
        for(RefinedEdgePtr edge : this->refinedEdges){
            edge->print();
        }
        std::cout << "INFO: ----------- VarTypes: " << std::endl;
        for(auto varTypePair : this->origCfg->getVarTypes()){
            std::cout << varTypePair.first + " " + varTypePair.second << std::endl;
        }
        std::cout << std::endl;
    }

} // namespace smack
