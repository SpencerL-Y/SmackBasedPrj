#include "smack/VarEquiv.h"

namespace smack
{
    // varAllocEqualMap operations
    void VarEquiv::addNewName(std::string name){
        if(varAllocEqualMap.find(name) == varAllocEqualMap.end()){
            // if the name is not found, then we add the name to it
            varAllocEqualMap[name] = name;
        } else {
            std::cout << "ERROR: VarEquiv new name exists." << std::endl;
        }
    }

    void VarEquiv::linkName(std::string newname, std::string oldname){
        if(varAllocEqualMap.find(newname) == varAllocEqualMap.end() && 
           varAllocEqualMap.find(oldname) != varAllocEqualMap.end()){
            varAllocEqualMap[newname] = varAllocEqualMap[oldname];
        } else {
            std::cout << "ERROR: VarEquiv new name exists "  << (varAllocEqualMap.find(newname) == varAllocEqualMap.end()) << " " << (varAllocEqualMap.find(oldname) != varAllocEqualMap.end()) << " " + newname + " " + oldname << std::endl;
        }
    }

    std::string VarEquiv::getAllocName(std::string name){
        // return the name first used when do the allocation
        if(varAllocEqualMap.find(name) != varAllocEqualMap.end()){
            return varAllocEqualMap[name];
        } else {
            return "$none"; 
        }
    }

    bool VarEquiv::hasName(std::string name){
        if(varAllocEqualMap.find(name) == varAllocEqualMap.end()){
            return false;
        } else {
            return true;
        }
    }

    void VarEquiv::debugPrint(){
        // DEBUG_WITH_COLOR(std::cout << "Debug VarEquiv: " << std::endl, color::green);
        // for(auto i : this->varAllocEqualMap){
        //     DEBUG_WITH_COLOR(std::cout << "Key: " << i.first << "| Var: " << i.second << std::endl, color::green);
        // }
        // DEBUG_WITH_COLOR(std::cout << "Debug BlkLinkName: " << std::endl, color::green);
        // for(auto i : this->pointsToBlkMap){
        //     DEBUG_WITH_COLOR(std::cout << "Key: " << i.first << "| Var: " << i.second << std::endl, color::green);
        // }
        // DEBUG_WITH_COLOR(std::cout << "Debug Offset:" << std::endl, color::green);
        // for(auto i : this->pointsToBlkOffset) {
        //     DEBUG_WITH_COLOR(std::cout << "Key: " << i.first << "| Var: " << i.second << std::endl, color::green);
        // }
        // DEBUG_WITH_COLOR(std::cout << "Debug IntVal: " << std::endl, color::green);
        // for(auto i : this->varToIntVal){
        //     DEBUG_WITH_COLOR(std::cout << "Key: " << i.first << "| Val: " << i.second << std::endl, color::green);
        // }
    }
    // name2blk operations


    void VarEquiv::addNewBlkName(std::string name){
        if(pointsToBlkMap.find(name) == pointsToBlkMap.end()){
            pointsToBlkMap[name] = name;
        } else {
            std::cout << "ERROR: VarEquiv blk new blkvarname exists. " << std::endl;
        }
    }

    void VarEquiv::linkBlkName(std::string newname, std::string blkname){
        if(pointsToBlkMap.find(newname) == pointsToBlkMap.end() && 
           pointsToBlkMap.find(blkname) != pointsToBlkMap.end()){
            pointsToBlkMap[newname] = pointsToBlkMap[blkname];
        } else {
            CFDEBUG(std::cout << "ERROR: VarEquiv new blk name exists "  << (pointsToBlkMap.find(newname) == pointsToBlkMap.end()) << " " << (pointsToBlkMap.find(blkname) != pointsToBlkMap.end()) << std::endl);
        }
    }

    std::string VarEquiv::getBlkName(std::string name){
        if(pointsToBlkMap.find(name) != pointsToBlkMap.end()){
            return pointsToBlkMap[name];
        } else {
            return nullptr;
        }
    }

    // name2blk offset operations

    void VarEquiv::addNewOffset(std::string name, int offset){
        if(this->pointsToBlkOffset.find(name) != this->pointsToBlkOffset.end()){
            DEBUG_WITH_COLOR(std::cout << "name,offset: " << name << ", " << offset << " already exists. " << std::endl, color::green);
        } else {
            this->pointsToBlkOffset[name] = offset;
        }
    }

    int VarEquiv::getOffset(std::string name){
        if(this->pointsToBlkOffset.find(name) != this->pointsToBlkOffset.end()){
            return pointsToBlkOffset[name];
        } else {
            DEBUG_WITH_COLOR(std::cout << "ERROR: VarEquiv blkoffset no name exists. " << std::endl, color::green);
            return -1;
        }
    }


    void VarEquiv::addNewVal(std::string name, int val){
        if(this->varToIntVal.find(name) == this->varToIntVal.end()){
            this->varToIntVal[name] = val;
        } else {
            DEBUG_WITH_COLOR(std::cout << "ERROR: VarIntMap no name exists. " << std::endl, color::green);
        }
    }

    void VarEquiv::linkIntVar(std::string newname, std::string oldname){
        if(this->varToIntVal.find(newname) == this->varToIntVal.end() &&
           this->varToIntVal.find(oldname) != this->varToIntVal.end()){
            this->varToIntVal[newname] = this->varToIntVal[oldname];
        } else {
            if((this->varToIntVal.find(newname) ==  this->varToIntVal.end()) && (this->varToIntVal.find(oldname) ==  this->varToIntVal.end())
            ){  
                DEBUG_WITH_COLOR(std::cout << "WARNING: VarIntMap link error. Newname: " << (this->varToIntVal.find(newname) !=  this->varToIntVal.end()) << " OldName: " << (this->varToIntVal.find(oldname) !=  this->varToIntVal.end()) << " " << newname << " " << oldname << std::endl, color::green);
            } else {
                DEBUG_WITH_COLOR(std::cout << "ERROR: VarIntMap link error. Newname: " << (this->varToIntVal.find(newname) !=  this->varToIntVal.end()) << " OldName: " << (this->varToIntVal.find(oldname) !=  this->varToIntVal.end()) << " " << newname << " " << oldname << std::endl, color::green);
            }
            
        }
    }

    std::pair<bool, int> VarEquiv::getIntVal(std::string name){
        if(this->varToIntVal.find(name) != this->varToIntVal.end()){
            return std::pair<bool, int>(true, this->varToIntVal[name]);
        } else {
            if(!name.find("$p")){
                DEBUG_WITH_COLOR(std::cout << "WARNING: VarIntMap get warning. " << name << std::endl, color::green);
            } else {
                DEBUG_WITH_COLOR(std::cout << "WARNING: VarIntMap get warning. " << name << std::endl, color::green);
            }
            
            return std::pair<bool, int>(false, 0);
        }
    }
    // isAllocPtr operations

    void VarEquiv::setStructArrayPtr(std::string name, bool val){
        assert(name.find("$p") != std::string::npos);
        this->structArrayPtr[name] = val;
    }


    
    bool VarEquiv::isStructArrayPtr(std::string name){
        assert(name.find("$p") != std::string::npos);
        return this->structArrayPtr[name];
    }

    // get a copy of the object

    VarEquivPtr VarEquiv::clone(){
        VarEquivPtr newVarEquiv = std::make_shared<VarEquiv>();
        newVarEquiv->setPointsToBlkMap(this->getPointsToBlkMap());
        newVarEquiv->setPointsToBlkOffset(this->getPointsToBlkOffset());
        newVarEquiv->setStructArrayPtr(this->getStructArrayPtr());
        newVarEquiv->setVarAllocEqualMap(this->getVarAllocEqualMap());
        newVarEquiv->setVarToIntVal(this->getVarToIntVal());
        return newVarEquiv;
    }

    std::map<std::string, std::string> VarEquiv::getVarAllocEqualMap(){
        return this->varAllocEqualMap;
    }
    std::map<std::string, std::string> VarEquiv::getPointsToBlkMap(){
        return this->pointsToBlkMap;
    }
    std::map<std::string, int> VarEquiv::getPointsToBlkOffset(){
        return this->pointsToBlkOffset;
    }
    std::map<std::string, int> VarEquiv::getVarToIntVal(){
        return this->varToIntVal;
    }
    std::map<std::string, bool> VarEquiv::getStructArrayPtr(){
        return this->structArrayPtr;
    }

    void VarEquiv::setVarAllocEqualMap(std::map<std::string, std::string> i){
        this->varAllocEqualMap = i;
    }
    void VarEquiv::setPointsToBlkMap(std::map<std::string, std::string> i){
        this->pointsToBlkMap = i;
    }
    void VarEquiv::setPointsToBlkOffset(std::map<std::string, int> i){
        this->pointsToBlkOffset = i;
    }
    void VarEquiv::setVarToIntVal(std::map<std::string, int> i){
        this->varToIntVal = i;
    }
    void VarEquiv::setStructArrayPtr(std::map<std::string, bool> i){
        this->structArrayPtr = i;
    }

} // namespace smack
