pragma solidity ^0.4.25;
pragma experimental ABIEncoderV2;

import "./Utility.sol";

contract BasePerson {

    // Imports all functions from a self-made library, used to convert strings to bytes and back
    using Utility for *;
    // Stores a person object currently being manipulated
    person _person;

    // Defines all attributes of a person object
    struct person {
        bytes32 email;
        bytes32 password;
        bytes32 townofbirth;
        bytes32 forenames;
        bytes32 surname;
        bytes32 prevsurnames;
        bytes32 maidenname;
        bytes32 postalstreetaddress;
        bytes32 postalsuburbaddress;
        bytes32 postalcityaddress;
        bytes32 residentialstreetaddress;
        bytes32 residentialsuburbaddress;
        bytes32 residentialcityaddress;
        bytes32 father_surname;
        bytes32 father_forenames;
        bytes32 mother_surname;
        bytes32 mother_forenames;
        bytes32 citizenship_ofothercountryreason;
        bytes32 marriagepartner_forenames;
        bytes32 marriagepartner_maidenname;
        bytes32 marriagepartner_townmarried;
        bytes32 id_remark;
        bytes32 passportnumber;

        bytes32 birthcert_appreason;
        bytes32 birthcert_personconcerned_surname;
        bytes32 birthcert_personconcerned_maidenname;
        bytes32 birthcert_personconcerned_forenames;
        bytes32 birthcert_personconcerned_townofbirth;
        bytes32 birthcert_personconcerned_father_surname;
        bytes32 birthcert_personconcerned_father_forenames;
        bytes32 birthcert_personconcerned_mother_surname;
        bytes32 birthcert_personconcerned_mother_forenames;

        uint8 birthcert_type;
        uint8 birthcert_personconcerned_dateofbirth;
        uint8 birthcert_personconcerned_identitynumber;
        uint8 birthcert_personconcerned_birthentrynumber;
        uint8 birthcert_personconcerned_provinceofbirth;

        uint8 immigrant_countryofcitizenship;
        uint8 immigrant_residencepermitnumber;
        uint8 immigrant_dateofpermanententry;
        uint8 naturalization_certificatenumber;
        uint8 naturalization_dateofissuance;
        uint8 citizenship_ofothercountrydate;
        uint8 citizenship_ofothercountrylocation;
        uint8 citizenship_ofothercountrylocationissued;
        uint8 countyofcitizenship;
        uint8 marriagepartner_identitynumber;
        uint8 marriagepartner_dateofbirth;
        uint8 marriagepartner_dateofmarriage;
        uint8 marriagepartner_maritualstatus;
        uint8 dateofbirth;
        uint8 identitynumber;
        uint8 birthentrynumber;
        uint8 postalcode;
        uint8 residentialcode;
        uint8 homenumber;
        uint8 hometelcode;
        uint8 worknumber;
        uint8 worktelcode;
        uint8 cellnumber;
        uint8 cellcode;
        uint8 idcardnumber;
        uint8 tbvc_idnumber;
        uint8 provinceofbirth;
        uint8 countryofbirth;
        uint8 maritualstatus;
        uint8 nationality;

        // False for Female; True for Male
        bool gender;
        bool id_lateregistration;
        bool tbvc;
        bool naturalization_acquiredbeforedate;
        bool citizenship_ofothercountry;
        // Used to identify whether person has their general information saved
        bool hasgeneralinformationsaved;
        // Used to identify whether person has their id information saved
        bool hasidentityinformationsaved;
        // Used to identify whether person has their birthcertificate information saved
        bool hasbirthcertificateinformationsaved;
    }

    // Sets a class' person so that functions can set/get respective attributes
    function setPerson(person tempperson) public {
        _person = tempperson;
    }

    // Retrieve updated person
    function getPerson() internal view returns (person) {
        return _person;
    }

    // Get functions for autonomous filling
    // Returns whether the person's general information has been saved yet or not
    function getGeneralInformationSaved() external view returns (bool) {
        return _person.hasgeneralinformationsaved;
    }

    // Returns whether the person's ID information has been saved yet or not
    function getIDInformationSaved() external view returns (bool) {
        return _person.hasidentityinformationsaved;
    }

    // Returns whether the person's birth certificate information has been saved yet or not
    function getBirthCertificateInformationSaved() external view returns (bool) {
        return _person.hasbirthcertificateinformationsaved;
    }

}
