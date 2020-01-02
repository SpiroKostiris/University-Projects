pragma solidity ^0.4.25;
pragma experimental ABIEncoderV2;

import "./InitialPerson.sol";
import "./Ownable.sol";

contract tPersonProtocol  is InitialPerson {

    // Create a custom array for records which is held within the contract. It is indexed by 32 byte strings (Transaction ID, see below)
    mapping (bytes32 => record) records;
    // Create an array for all record IDs
    bytes32[] recordsByID;
    // Magic number used for our hashing algorithm
    uint nonce = 0;

    // Create a simple object like data structure
    struct record{
        uint timestamp;
        address source;
        address destination;
        bytes32 updateid;
        BasePerson.person personpayload;
    }

    function addRecord (address _destination, bytes32 _updateid, BasePerson.person _personpayload) public {
        // Entities aren't able to create a record about themselves.
        // Require will validate this constraint, if constraint is true then the contract will refund all ether (that is not spent) back to the entity who made the transaction.
        require(_destination != msg.sender && (_updateid==0x00 || records[_updateid].source == msg.sender));

        // We create an unique ID in a form of 32 bytes. Since EVM does not house any PRNG algorithms. We need to create one for ourselves.
        // Encode everything together, since keccak only takes single byte data
        bytes32 txid = keccak256(abi.encodePacked(msg.sender, _destination, block.difficulty, msg.data, nonce++));

        // We can only set the timestamp to the recent block's timestamp
        records[txid].timestamp = block.timestamp;

        // Get the address of the sender
        records[txid].source = msg.sender;
        records[txid].destination = _destination;
        records[txid].updateid = _updateid;
        records[txid].personpayload = _personpayload;

        // Push the transaction ID into a premade array, which we will use to return all TX ids at once.
        recordsByID.push(txid);
    }

    // Return all transcation/record IDs
    function getRecordIDs() external view returns (bytes32[]) {
        return recordsByID;
    }

    // Return the number of records held in the contract
    function getRecordNumber() external view returns (uint){
        return recordsByID.length;
    }

    // Return Record data which is indexed from a given 32 byte input
    function getRecord(bytes32 txid) external view returns (uint timestamp, address source, address destination, bytes32 updateid, BasePerson.person personpayload){
        return(records[txid].timestamp, records[txid].source, records[txid].destination, records[txid].updateid, records[txid].personpayload);
    }

}
