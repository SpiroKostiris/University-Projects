pragma solidity ^0.4.25;
pragma experimental ABIEncoderV2;

import "./BasePerson.sol";

contract InitialPerson is BasePerson {

    mapping(address => bool) isPerson;
    mapping(bytes32 => bool) emailTaken;
    mapping(bytes32 => bool) passwordTaken;

    // Saves email, password
    function saveSignUpDetails (string _email, string _password, string _townofbirth) public payable {
        _person.email = Utility.stringToBytes32(_email);
        _person.password = Utility.stringToBytes32(_password);
        _person.townofbirth = Utility.stringToBytes32(_townofbirth);

        // Saves boolean to know if person object exists on blockchain
        isPerson[tx.origin] = true;
        emailTaken[Utility.stringToBytes32(_email)] = true;
        passwordTaken[Utility.stringToBytes32(_password)] = true;
    }

    // Returns whether this person's address/person exists in blockchain
    function exists() external view returns(bool) {
        return isPerson[tx.origin];
    }

    // Gets login details that need to be matched with, front end
    function getLoginDetails() external view returns (string, string){
        return (Utility.bytes32ToString(_person.email), Utility.bytes32ToString(_person.password));
    }

    // Gets recovery details of person if password forgotten. Only person address of
    // data can get this and their details must still be verified to the input given front-end
    function getRecoveryDetails() external view returns (string, string) {
        return (Utility.bytes32ToString(_person.email), Utility.bytes32ToString(_person.townofbirth));
    }

    // Checks if email already exists onchain
    // 1 - Already exists
    // 0 - Valid email
    function validateEmail(string input_email) external view returns (bool) {
        return (emailTaken[Utility.stringToBytes32(input_email)]);
    }

    // Checks if password exists onchain
    // Return values are the same as above
    function validatePassword(string input_password) external view returns (bool) {
        return (passwordTaken[Utility.stringToBytes32(input_password)]);
    }

}

