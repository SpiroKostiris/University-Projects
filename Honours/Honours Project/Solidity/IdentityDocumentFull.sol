pragma solidity ^0.4.25;
pragma experimental ABIEncoderV2;

import "./BasePerson.sol";

contract IdentityDocumentFull is BasePerson {

    // Returns the information of a person for an identity document
    // Personal Details
    function getIDInformation_1() external view returns(string, string, string, string) {
        return(Utility.bytes32ToString(_person.forenames), Utility.bytes32ToString(_person.surname), Utility.bytes32ToString(_person.maidenname), Utility.bytes32ToString(_person.townofbirth));
    }

    // Personal numbers
    function getIDInformation_2() external view returns (uint, uint, uint8, uint, uint, bool) {
        return(_person.identitynumber, _person.birthentrynumber, _person.dateofbirth, _person.maritualstatus, _person.countryofbirth, _person.gender);
    }

    // Personal Status/Immigrant Details
    function getIDInformation_3() external view returns(uint8, uint8, uint8, uint8, uint8, bool) {
        return(_person.immigrant_residencepermitnumber, _person.immigrant_countryofcitizenship, _person.immigrant_dateofpermanententry, _person.naturalization_certificatenumber, _person.naturalization_dateofissuance, _person.naturalization_acquiredbeforedate);
    }

    // Citizenship Details
    function getIDInformation_4() external view returns(bool, string, uint8, uint8, uint8) {
        return(_person.citizenship_ofothercountry, Utility.bytes32ToString(_person.citizenship_ofothercountryreason), _person.citizenship_ofothercountrydate, _person.citizenship_ofothercountrylocation, _person.citizenship_ofothercountrylocationissued);
    }

    // Residential Details
    function getIDInformation_5() external view returns(string, string, string, uint8) {
        return(Utility.bytes32ToString(_person.residentialstreetaddress), Utility.bytes32ToString(_person.residentialsuburbaddress), Utility.bytes32ToString(_person.residentialcityaddress), _person.residentialcode);
    }

    // Postal Details
    function getIDInformation_6() external view returns(string, string, string, uint8) {
        return(Utility.bytes32ToString(_person.postalstreetaddress), Utility.bytes32ToString(_person.postalsuburbaddress), Utility.bytes32ToString(_person.postalcityaddress), _person.postalcode);
    }

    // Marriage Partner Details
    function getIDInformation_7() external view returns(string, string, string) {
        return(Utility.bytes32ToString(_person.marriagepartner_forenames), Utility.bytes32ToString(_person.marriagepartner_maidenname), Utility.bytes32ToString(_person.marriagepartner_townmarried));
    }

    //Marriage Partner Numbers
    function getIDInformation_8() external view returns(uint8, uint8, uint8, uint8) {
        return(_person.marriagepartner_identitynumber, _person.marriagepartner_dateofbirth, _person.marriagepartner_maritualstatus, _person.marriagepartner_dateofmarriage);
    }

    // Phone Numbers
    function getIDInformation_9() external view returns(uint8, uint8, uint8, uint8) {
        return(_person.homenumber, _person.hometelcode, _person.cellnumber, _person.cellcode);
    }

    // General Details
    function getIDInformation_10() external view returns(string, uint8, uint8, bool, bool) {
        return(Utility.bytes32ToString(_person.id_remark), _person.idcardnumber, _person.tbvc_idnumber, _person.id_lateregistration, _person.tbvc);
    }

}
