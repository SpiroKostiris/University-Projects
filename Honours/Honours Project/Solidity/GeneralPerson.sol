pragma solidity ^0.4.25;
pragma experimental ABIEncoderV2;

import "./BasePerson.sol";

contract GeneralPerson is BasePerson {

    // Saves General Information
    // Names
    function saveGeneralInformation_1 (string _forenames, string _surname, string _prevsurnames, string _maidenname) public {
        _person.forenames = Utility.stringToBytes32(_forenames);
        _person.surname = Utility.stringToBytes32(_surname);
        _person.prevsurnames = Utility.stringToBytes32(_prevsurnames);
        _person.maidenname = Utility.stringToBytes32(_maidenname);
    }

    // Personal Details
    function saveGeneralInformation_2 (string _townofbirth,  uint _maritualstatus, uint _dateofbirth, uint _countryofbirth,  uint _nationality, bool _gender) public {
        _person.townofbirth = Utility.stringToBytes32(_townofbirth);

        _person.maritualstatus = uint8(_maritualstatus);
        _person.dateofbirth = uint8(_dateofbirth);
        _person.countryofbirth = uint8(_countryofbirth);
        _person.nationality = uint8(_nationality);

        _person.gender = _gender;
    }

    // Residential Address Details
    function saveGeneralInformation_3 (string _residentialstreetaddress, string _residentialsuburbaddress, string _residentialcityaddress, uint _residentialcode) public {
        _person.residentialstreetaddress = Utility.stringToBytes32(_residentialstreetaddress);
        _person.residentialsuburbaddress = Utility.stringToBytes32(_residentialsuburbaddress);
        _person.residentialcityaddress = Utility.stringToBytes32(_residentialcityaddress);

        _person.residentialcode = uint8(_residentialcode);
    }

    // Postal Address Details
    function saveGeneralInformation_4 (string _postalstreetaddress, string _postalsuburbaddress, string _postalcityaddress, uint _postalcode) public {
        _person.postalstreetaddress = Utility.stringToBytes32(_postalstreetaddress);
        _person.postalsuburbaddress = Utility.stringToBytes32(_postalsuburbaddress);
        _person.postalcityaddress = Utility.stringToBytes32(_postalcityaddress);

        _person.postalcode = uint8(_postalcode);
    }

    // Identifiable Numbers
    function saveGeneralInformation_5 (string _passportnumber, uint _identitynumber) public {
        _person.passportnumber = Utility.stringToBytes32(_passportnumber);
        _person.identitynumber = uint8(_identitynumber);
    }

    // Phone Numbers
    function saveGeneralInformation_6 (uint _homenumber, uint _hometelcode, uint _worknumber, uint _worktelcode, uint _cellnumber, uint _cellcode) public {
        _person.homenumber = uint8(_homenumber);
        _person.hometelcode = uint8(_hometelcode);
        _person.worknumber = uint8(_worknumber);
        _person.worktelcode = uint8(_worktelcode);
        _person.cellnumber = uint8(_cellnumber);
        _person.cellcode = uint8(_cellcode);

        _person.hasgeneralinformationsaved = true;
    }

    // Returns general information used in application forms
    // Names
    function getGeneralInformation_1() external view returns (bytes32, bytes32, bytes32, bytes32) {
        return (_person.forenames, _person.surname, _person.prevsurnames, _person.maidenname);
    }

    // Personal Details
    function getGeneralInformation_2() external view returns (bytes32, uint8, uint8, uint8, uint8, bool) {
        return (_person.townofbirth, _person.maritualstatus,  _person.dateofbirth, _person.countryofbirth, _person.nationality, _person.gender);
    }

    // Residential Address Details
    function getGeneralInformation_3() external view returns (bytes32, bytes32, bytes32, uint8) {
        return(_person.residentialstreetaddress, _person.residentialsuburbaddress, _person.residentialcityaddress, _person.residentialcode);
    }

    // Postal Address details
    function getGeneralInformation_4() external view returns (bytes32, bytes32, bytes32, uint8) {
        return(_person.postalstreetaddress, _person.postalsuburbaddress, _person.postalcityaddress,  _person.postalcode);
    }

    // Identifiable Numbers
    function getGeneralInformation_5() external view returns (bytes32, uint8) {
        return(_person.passportnumber, _person.identitynumber);
    }

    // Phone Numbers
    function getGeneralInformation_6() external view returns (uint8, uint8, uint8, uint8, uint8, uint8) {
        return(_person.homenumber, _person.hometelcode, _person.worknumber, _person.worktelcode, _person.cellnumber, _person.cellcode);
    }

}
