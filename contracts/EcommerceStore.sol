// SPDX-License-Identifier: MIT
pragma solidity >=0.4.21 <0.9.0;

contract EcommerceStore {
    enum ProductCondition {New, Used}
    uint256 public productIndex;

    address public arbiter;

    mapping (address => mapping(uint256 => Product)) stores;
    mapping (uint256 => address payable) productIdInStore;

    mapping (uint256 => address) productEscrow;
    struct Product {
        uint256 id;
        string name;
        string category;
        string imageLink;
        string descLink;
        uint256 startTime;
        uint256 price;
        ProductCondition condition;
        address buyer;
    }

    constructor() {
        productIndex = 0;
    }
3   

}