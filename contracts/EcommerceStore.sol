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

    function addProductToStore(
        uint256 _id, 
        string memory _name, 
        string memory _category, 
        string memory _imageLink, 
        string memory _descLink, 
        uint256 _startTime, 
        uint256 _price, 
        ProductCondition _productCondition, 
        address _buyer) public {
        
        productIndex += 1;
        Product memory product = Product(productIndex, _name, _category, _imageLink,_descLink, _startTime,
                                        _price, ProductCondition(_productCondition), address(0));
        stores[msg.sender][productIndex] = product;
        productIdInStore[productIndex] = payable(msg.sender);

    }

    function getProduct(uint256 _productId) public view returns(
        uint256, 
        string memory, 
        string memory, 
        string memory, 
        string memory, 
        uint256, 
        uint256, 
        ProductCondition, 
        address) {
        Product memory product = stores[productIdInStore[_productId]][_productId];
        
        return (product.id, product.name, product.category, product.imageLink, product.descLink,
                product.startTime, product.price, product.condition, product.buyer);
    }

    

}