// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract assetsContract {
    struct asset {
        string name;
        string parentIds;
        string traderId;
        string description;
        categorisation _categorisation;
        string sku;
        string country;
        string purity;
        string unit;
        string weight;
        price _price;
        string salesType;
        uint64 minPrice;
        string documentType;
        string certificate;
        string files;
        string testingLab;
        otherInformation _otherInformation;
        string publishedOn;
        bool agreeToTermsAndConditions;
    }

    struct categorisation {
        string _type;
        string category;
        string subcategory;
    }

    struct price {
        string currency;
        uint64 amount;
    }

    struct otherInformation {
        string paymentTerms;
        uint64 moq;
        string shippingMethod;
        string deliveryTerms;
        string warehouseLocation;
        string pin;
    }

    mapping(uint256 => asset) public Assets; //id should be unique in asset

    function saveAsset(
       
    ) external {
    }

    function getAsset(uint256 _id) public view returns (asset memory) {
        return Assets[_id];
    }

    function trackAsset(uint256 _id) public view returns (string memory) {
        return;
    }
}
