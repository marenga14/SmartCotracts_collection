// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract bankTransaction {

    struct BankTransaction {
        address paymentIdentifier;
        address clientIdentifier;
        address recepientIdentifier;
        uint256 amount;
        uint16 time;
        bytes32 value;
    }
mapping (address => BankTransaction) banktx;
BankTransaction [] transArray;

/* concatination   function */
     function concatenate( address _receiptId,uint256 _ammout, uint16 _time, address txId, address clientId) public pure returns (string memory){
        return string(abi.encodePacked(_receiptId,_ammout, _time,txId,clientId));
    } 



/* adding the transaction details*/

function addingNewPayment (address _receiptId,uint256 _ammout, uint16 _time, address txId) public {
 

 bytes32 preValue  =  keccak256(bytes(concatenate(_receiptId,_ammout, _time,txId,msg.sender)));
    BankTransaction memory newTx = BankTransaction ({
        paymentIdentifier:txId,
        clientIdentifier: msg.sender,
        recepientIdentifier:_receiptId,
        amount: _ammout,
        time :_time,
        value: preValue
    });
 

 banktx [txId] = newTx;
 transArray.push( newTx);

}


/* get transaction from the given transaction ID */
 function getTransaction (address _txId) public view   returns (BankTransaction memory){
     return banktx[_txId];


 }


/* get all the transaction that the customer has performed */
 function getAllCustomerPayment (address _customerId) public view returns (BankTransaction [] memory){
          uint256 arrayLength = transArray.length;
        BankTransaction[] memory customerTransArray = new BankTransaction[](arrayLength);
        uint256 counter;

     for (uint256 i; i< transArray.length; i++){

         if (transArray[i].clientIdentifier == _customerId){
             customerTransArray[counter] = transArray [i];
             counter ++;

         }
     }
 return customerTransArray;

     
  
 }



}