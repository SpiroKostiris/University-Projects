pragma solidity ^0.4.25;
pragma experimental ABIEncoderV2;

import "./BasePerson.sol";

contract IdentityDocument is BasePerson {

    // Saves the information needed from a person for an identity document
    // Personal details
    function saveIDFormInformation_1 (string _forenames, string _surname, string _maidenname, string _townofbirth) public {
        _person.forenames = Utility.stringToBytes32(_forenames);
        _person.surname = Utility.stringToBytes32(_surname);
        _person.maidenname = Utility.stringToBytes32(_maidenname);
        _person.townofbirth = Utility.stringToBytes32(_townofbirth);
    }

    // Personal Numbers
    function saveIDFormInformation_2 (uint _identitynumber, uint _birthentrynumber, uint _dateofbirth, uint _maritualstatus, uint _countryofbirth, bool _gender) public {
        _person.identitynumber = uint8(_identitynumber);
        _person.birthentrynumber = uint8(_birthentrynumber);
        _person.dateofbirth = uint8(_dateofbirth);
        _person.maritualstatus = uint8(_maritualstatus);
        _person.countryofbirth = uint8(_countryofbirth);

        _person.gender = _gender;
    }

    // Personal Status/Immigrant Details
    function saveIDFormInformation_3 (uint _immigrant_residencepermitnumber, uint _immigrant_countryofcitizenship, uint _immigrant_dateofpermanententry) public {
        _person.immigrant_residencepermitnumber = uint8(_immigrant_residencepermitnumber);
        _person.immigrant_countryofcitizenship = uint8(_immigrant_countryofcitizenship);
        _person.immigrant_dateofpermanententry = uint8(_immigrant_dateofpermanententry);
    }

    // Personal Status Naturalization
    function saveIDFormInformation_4 (uint _naturalization_certificatenumber, uint _naturalization_dateofissuance, bool _naturalization_acquiredbeforedate) public {
        _person.naturalization_certificatenumber = uint8(_naturalization_certificatenumber);
        _person.naturalization_dateofissuance = uint8(_naturalization_dateofissuance);

        _person.naturalization_acquiredbeforedate = _naturalization_acquiredbeforedate;
    }

    // Citizenship Details
    function saveIDFormInformation_5 (bool _citizenehip_ofothercountry, string _citizenship_ofothercountryreason, uint _citizenship_ofothercountrydate, uint _citizenship_ofothercountrylocation, uint8 _citizenship_ofothercountrylocationissued) public {
        // Used to respectively enable/disable certain fields in order to avoid user input error
        _person.citizenship_ofothercountry = _citizenehip_ofothercountry;

        _person.citizenship_ofothercountryreason = Utility.stringToBytes32(_citizenship_ofothercountryreason);
        _person.citizenship_ofothercountrylocation = uint8(_citizenship_ofothercountrylocation);
        _person.citizenship_ofothercountrydate = uint8(_citizenship_ofothercountrydate);
        _person.citizenship_ofothercountrylocationissued = uint8(_citizenship_ofothercountrylocationissued);
    }

    // Residential Details
    function saveIDFormInformation_6 (string _residentialstreetaddress, string _residentialsuburbaddress, string _residentialcityaddress, uint _residentialcode) public {
        _person.residentialstreetaddress = Utility.stringToBytes32(_residentialstreetaddress);
        _person.residentialsuburbaddress = Utility.stringToBytes32(_residentialsuburbaddress);
        _person.residentialcityaddress = Utility.stringToBytes32(_residentialcityaddress);

        _person.residentialcode = uint8(_residentialcode);
    }

    // Postal Details
    function saveIDFormInformation_7 (string _postalstreetaddress, string _postalsuburbaddress, string _postalcityaddress, uint _postalcode) public {
        _person.postalstreetaddress = Utility.stringToBytes32(_postalstreetaddress);
        _person.postalsuburbaddress = Utility.stringToBytes32(_postalsuburbaddress);
        _person.postalcityaddress = Utility.stringToBytes32(_postalcityaddress);

        _person.postalcode = uint8(_postalcode);
    }

    // Marriage Partner Details
    function saveIDFormInformation_8 (string _marriagepartner_forenames, string _marriagepartner_maidenname, string _marriagepartner_townmarried) public {
        _person.marriagepartner_forenames = Utility.stringToBytes32(_marriagepartner_forenames);
        _person.marriagepartner_maidenname = Utility.stringToBytes32(_marriagepartner_maidenname);
        _person.marriagepartner_townmarried = Utility.stringToBytes32(_marriagepartner_townmarried);
    }

    // Marriage Partner Numbers
    function saveIDFormInformation_9 (uint8 _marriagepartner_identitynumber, uint8 _marriagepartner_dateofbirth, uint8 _marriagepartner_maritualstatus, uint8 _marriagepartner_dateofmarriage) public {
        _person.marriagepartner_identitynumber = _marriagepartner_identitynumber;
        _person.marriagepartner_maritualstatus = _marriagepartner_maritualstatus;
        _person.marriagepartner_dateofbirth = _marriagepartner_dateofbirth;
        _person.marriagepartner_dateofmarriage = _marriagepartner_dateofmarriage;
    }

    // General Details
    function saveIDFormInformation_10 (string _id_remark, uint _homenumber, uint _hometelcode, uint _cellnumber, uint _cellcode, uint _idcardnumber, uint _tbvc_idnumber, bool _id_lateregistration, bool _tbvc) public {
        _person.id_remark = Utility.stringToBytes32(_id_remark);

        _person.homenumber = uint8(_homenumber);
        _person.hometelcode = uint8(_hometelcode);
        _person.cellnumber = uint8(_cellnumber);
        _person.cellcode = uint8(_cellcode);

        _person.idcardnumber = uint8(_idcardnumber);
        _person.tbvc_idnumber = uint8(_tbvc_idnumber);

        _person.id_lateregistration = _id_lateregistration;
        _person.tbvc = _tbvc;

        _person.hasidentityinformationsaved = true;
    }

}
