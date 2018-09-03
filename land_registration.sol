pragma solidity ^0.4.20;

//contract name
contract Land_Details {
    
//struct to define the details related to the land    
   struct LandDetails{
      string owner;
      string email;
      string streetname;
      string city;
      string country;
      string tehsilOffice;
      string District;
      string LandType;
      string current_owner;
      string buyer;
      string buyer_address;
      string DocumentStorage;
      
      uint256 phoneNumber;
      uint256 street_number;
      uint256 postcode;
      uint256 registration_number;
      uint256 registration_year;
      uint256 PlotNumber;
      uint256 Area;
      uint256 unitof_measurement;
      uint256 stamp_amount;
      uint256 cirlce_rate;
      uint256 cirlce_owner;
      uint256 stampCertificateNumber;
      uint256 ECcertificateNumber;
      uint256 adharNumber;
      
    }
    

//mapping to strore all the Land_Details wrt to address, can be used to return the details with     
    mapping (address => LandDetails ) land_mapping;
    
    address[] public land_accounts;
    

    function setLandDetails( 
      address _address,
      string new_owner,
    //   string new_email,
    //   string new_streetname,
      string new_city,
    //   string new_country,
    //   string new_tehsilOffice,
    //   string new_District,
    //   string new_LandType,
    //   string new_current_owner,
    //   string new_buyer,
    //   string new_buyer_address,
    //   string new__DocumentStorage,
    //   uint256 new_phoneNumber,
    //   uint256 new_street_number,
    //   uint256 new_postcode,
      uint256 new_registration_number,
      uint256 new_registration_year,
    //   uint256 new_PlotNumber,
      uint256 new_Area,
      uint256 new_unitof_measurement,
      uint256 new_stamp_amount,
      uint256 new_cirlce_rate,
      uint256 new_cirlce_owner,
      uint256 new_stampCertificateNumber,
      uint256 new_ECcertificateNumber,
      uint256 new_adharNumber
        
        ) public {
        
        var Land = land_mapping[_address];
        
        Land.owner = new_owner;
        // Land.email = new_email;
        // Land.streetname = new_streetname;
        Land.city = new_city;
        // Land.country = new_country;
        // Land.tehsilOffice = new_tehsilOffice;
        // Land.District = new_District;
        // Land.LandType = new_LandType;
        // Land.current_owner = new_current_owner;
        // Land.buyer = new_buyer;
        // Land.buyer_address = new_buyer_address;
        // Land.DocumentStorage = new__DocumentStorage;
        // Land.phoneNumber = new_phoneNumber;
        // Land.street_number = new_street_number;
        // Land.postcode = new_postcode;
        Land.registration_number = new_registration_number;
        Land.registration_year = new_registration_year;
        // Land.PlotNumber = new_PlotNumber;
        Land.Area = new_Area;
        Land.unitof_measurement = new_unitof_measurement;
        Land.stamp_amount = new_stamp_amount;
        Land.cirlce_rate = new_cirlce_rate;
        Land.cirlce_owner = new_cirlce_owner;
        Land.stampCertificateNumber = new_stampCertificateNumber;
        Land.ECcertificateNumber = new_ECcertificateNumber;
        Land.adharNumber = new_adharNumber;
         
        land_accounts.push(_address) - 1;
        
    }
    
    //returns  the address of lands
    function getlands() view public returns(address[]) {
           return land_accounts;
    }
    
    
    //return the details of land from address
    
    function getland(address _address) view public returns(string , string, uint256,uint256)  {
        return (land_mapping[_address].owner, land_mapping[_address].District, land_mapping[_address].unitof_measurement , land_mapping[_address].adharNumber);
    }
        
        
    function Countland () view public returns       (uint){
        return land_accounts.length;
    }    
    
}
