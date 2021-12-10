// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;
pragma experimental ABIEncoderV2;

contract watchContract {
    
    struct watchinfo{
        string  filePath;
        bool watchStatus;
        address ownerAddress;
    }
    
    struct watch {
        string ownerName;
        bool watchInsured;
        string dateOfLoss;
        string  cityOfLoss;
        string  lossDescription;
        string  brand;
        string  model;
        uint256 serialNumber;
        string  description;
        string  material;
        watchinfo info; 
    }
    
    watch [] public watches;
    
    
    mapping(address => watch ) public watchDetail;
    mapping(string => address) getAddressFromName;
    mapping(uint256 => address) getAddressFromserialNumber;
    
    
    
    function saveWatchDetails(
        string memory _ownername,
        bool _watchInsured, 
        string memory _dateOfloss,
        string memory _cityOfLoss,
        string memory _lossDescription,
        string memory _brand,
        string memory _model,
        uint256 _serialNumber,
        string memory _description,
        string memory _material,
        string memory _filePath
        ) public {
            
        watchinfo memory _info = watchinfo(
            _filePath,
            true,
            msg.sender
            );
            
       watch memory x = watch(
       _ownername,
       _watchInsured,
       _dateOfloss,
       _cityOfLoss,
       _lossDescription,
       _brand,
       _model,
       _serialNumber,
       _description,
       _material,
       _info
       );
       
       watches.push(x);
       watchDetail[msg.sender] = x;
       getAddressFromName[_ownername] = msg.sender;
       getAddressFromserialNumber[_serialNumber] = msg.sender;
    }
    
    function getNumberOfWatches() public view returns(uint256) {
        return watches.length;
    }
    
    function searchByName(string memory ownername) public view returns(watch memory){
        address contract_addr = getAddressFromName[ownername];
        return watchDetail[contract_addr];
    }
    
    function watchStatusByserialNumber(uint256 serialNumber) public view returns(bool){
        address contractAddr = getAddressFromserialNumber[serialNumber];
        return watchDetail[contractAddr].info.watchStatus;
    }
    
     function setwatchStatusByserialNumber(uint256 serialNumber, bool watchStatus) public {
        address contractAddr = getAddressFromserialNumber[serialNumber];
        watchDetail[contractAddr].info.watchStatus = watchStatus;
    }
    
    function transferWatch(address toAddress, uint256 serialNumber) public returns(bool response){
        {
            
            address contract_addr = getAddressFromserialNumber[serialNumber];
            
            getAddressFromserialNumber[serialNumber] = toAddress;
            getAddressFromName[watchDetail[contract_addr].ownerName] = toAddress;
            watchDetail[contract_addr].info.ownerAddress = toAddress;
            watchDetail[toAddress] = watchDetail[contract_addr];
            delete watchDetail[contract_addr];
            
            return true;
        
        }
    }
}