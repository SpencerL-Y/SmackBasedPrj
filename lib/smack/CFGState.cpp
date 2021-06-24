#include "smack/CFGState.h"

#include <utility>

namespace smack
{

    void CFGState::addEdge(const EdgePtr& edgePtr) {
        auto blockName = edgePtr->getToState().lock()->getBlockName();
        auto from = edgePtr->getFromState();
        auto to = edgePtr->getToState();
        from.lock()->successors.push_back(to);
        to.lock()->predecessors.push_back(from);
        addEdge(blockName, edgePtr);
    }

    void CFGState::addEdge(const std::string& blockName, EdgePtr edgePtr) {
        edges[blockName] = std::move(edgePtr);
    }

    std::string CFGState::getBlockName() {
        return stateBlock->getName();
    }

    void CFGState::setCFG(const std::weak_ptr<CFG>& cfgWPtr) {
        cfgPtr = cfgWPtr;
    }

    std::weak_ptr<CFG> CFGState::getCFGPtr() {
        return cfgPtr;
    }

    std::vector<std::weak_ptr<CFGState>> CFGState::getPredecessors() {
        return predecessors;
    }

    std::vector<std::weak_ptr<CFGState>> CFGState::getSuccessors() {
        return successors;
    }

    void CFGState::addAttr(const std::string &s) {
        return attr.push_back(s);
    }
} // namespace smack
