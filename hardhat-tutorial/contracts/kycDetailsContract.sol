// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract kycInfoContract {
    struct kycInfo {
        string certificateOfIncorporation;
        address userAddress;
        string articlesOfAssociation;
        uint64 taxID;
    }

    mapping(address => kycInfo) public kycInformation;

    function saveKycInformation(
        string memory _certificateOfIncorporation,
        address _userAddress,
        string memory _articlesOfAssociation,
        uint64 _taxID
    ) public pure {
        kycInfo memory kycDetails;
        kycDetails.certificateOfIncorporation = _certificateOfIncorporation;
        kycDetails.userAddress = _userAddress;
        kycDetails.articlesOfAssociation = _articlesOfAssociation;
        kycDetails.taxID = _taxID;
    }

    function getKycDetailbynumber(address _userAddress)
        public
        view
        returns (kycInfo memory)
    {
        return kycInformation[_userAddress];
    }
}
