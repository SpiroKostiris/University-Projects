pragma solidity ^0.4.25;
pragma experimental ABIEncoderV2;

import "./BasePerson.sol";

contract BirthCertificate is BasePerson {

    // Saves the information needed from a person for a birth certificate
    // Person Concerned Details
    function saveBirthCertificateInformation_1 (string _birthcert_personconcerned_surname, string _birthcert_personconcerned_maidenname, string _birthcert_personconcerned_forenames, string _birthcert_personconcerned_townofbirth, uint8 _birthcert_personconcerned_dateofbirth, uint8 _birthcert_personconcerned_identitynumber, uint8 _birthcert_personconcerned_birthentrynumber, uint8 _birthcert_personconcerned_provinceofbirth) public {
        _person.birthcert_personconcerned_surname = Utility.stringToBytes32(_birthcert_personconcerned_surname);
        _person.birthcert_personconcerned_maidenname = Utility.stringToBytes32(_birthcert_personconcerned_maidenname);
        _person.birthcert_personconcerned_forenames = Utility.stringToBytes32(_birthcert_personconcerned_forenames);
        _person.birthcert_personconcerned_townofbirth = Utility.stringToBytes32(_birthcert_personconcerned_townofbirth);

        _person.birthcert_personconcerned_identitynumber = _birthcert_personconcerned_identitynumber;
        _person.birthcert_personconcerned_dateofbirth = _birthcert_personconcerned_dateofbirth;
        _person.birthcert_personconcerned_birthentrynumber = _birthcert_personconcerned_birthentrynumber;
        _person.birthcert_personconcerned_provinceofbirth = _birthcert_personconcerned_provinceofbirth;
    }

    // Parents Details
    function saveBirthCertificateInformation_2 (string _birthcert_personconcerned_father_surname, string _birthcert_personconcerned_father_forenames, string _birthcert_personconcerned_mother_surname, string _birthcert_personconcerned_mother_forenames) public {
        _person.birthcert_personconcerned_father_surname = Utility.stringToBytes32(_birthcert_personconcerned_father_surname);
        _person.birthcert_personconcerned_father_forenames = Utility.stringToBytes32(_birthcert_personconcerned_father_forenames);
        _person.birthcert_personconcerned_mother_surname = Utility.stringToBytes32(_birthcert_personconcerned_mother_surname);
        _person.birthcert_personconcerned_mother_forenames = Utility.stringToBytes32(_birthcert_personconcerned_mother_forenames);
    }

    // Personal Details
    function saveBirthCertificateInformation_3 (string _surname, string _forenames, uint8 _homenumber, uint8 _hometelcode, uint8 _worknumber, uint8 _worktelcode) public {
        _person.surname = Utility.stringToBytes32(_surname);
        _person.forenames = Utility.stringToBytes32(_forenames);

        _person.homenumber = _homenumber;
        _person.hometelcode = _hometelcode;
        _person.worknumber = _worknumber;
        _person.worktelcode = _worktelcode;
    }

    //Postal Details
    function saveBirthCertificateInformation_4 (string _postalstreetaddress, string _postalsuburbaddress, string _postalcityaddress, uint8 _postalcode) public {
        _person.postalstreetaddress = Utility.stringToBytes32(_postalstreetaddress);
        _person.postalsuburbaddress = Utility.stringToBytes32(_postalsuburbaddress);
        _person.postalcityaddress = Utility.stringToBytes32(_postalcityaddress);

        _person.postalcode = _postalcode;
    }

    // General Details
    function saveBirthCertificateInformation_5 (string _birthcert_appreason, uint8 _birthcert_type) public {
        _person.birthcert_appreason = Utility.stringToBytes32(_birthcert_appreason);
        _person.birthcert_type= _birthcert_type;

        _person.hasbirthcertificateinformationsaved = true;
    }

    // Returns the information of a person for a birth certificate
    // Person Concerned Details
    function getBirthCertificateInformation_1 () external view returns (string, string, string, string, uint8, uint8, uint8, uint8) {
        return(Utility.bytes32ToString(_person.birthcert_personconcerned_surname), Utility.bytes32ToString(_person.birthcert_personconcerned_maidenname), Utility.bytes32ToString(_person.birthcert_personconcerned_forenames), Utility.bytes32ToString(_person.birthcert_personconcerned_townofbirth), _person.birthcert_personconcerned_dateofbirth, _person.birthcert_personconcerned_provinceofbirth, _person.birthcert_personconcerned_identitynumber, _person.birthcert_personconcerned_birthentrynumber);
    }

    // Person Concerned Parent's details
    function getBirthCertificateInformation_2 () external view returns (bytes32, bytes32, bytes32, bytes32) {
        return(_person.birthcert_personconcerned_father_forenames, _person.birthcert_personconcerned_father_surname,_person.birthcert_personconcerned_mother_forenames, _person.birthcert_personconcerned_mother_surname);
    }

    // Personal Details
    function getBirthCertificateInformation_3 () external view returns (bytes32, bytes32,  uint8, uint8, uint8, uint8) {
        return(_person.surname, _person.forenames, _person.homenumber, _person.hometelcode, _person.worknumber, _person.worktelcode);
    }

    // Postal Details
    function getBirthCertificateInformation_4 () external view returns (bytes32, bytes32, bytes32, uint8) {
        return(_person.postalstreetaddress, _person.postalsuburbaddress, _person.postalcityaddress, _person.postalcode);
    }

    // General Details
    function getBirthCertificateInformation_5 () external view returns (string, uint8) {
        return(Utility.bytes32ToString(_person.birthcert_appreason), _person.birthcert_type);
    }

}
