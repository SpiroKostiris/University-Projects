pragma solidity ^0.4.25;

contract Person{
    struct person{
        string email;
        string password;
        string townofbirth;
        string forenames;
        string surname;
        string prevsurnames;
        string maidenname;
        string postalstreetaddress;
        string postalsuburbaddress;
        string postalciytaddress;
        string residentialstreetaddress;
        string residentialsuburbaddress;
        string residentialciytaddress;
        string maritualstatus;
        string nationality;
        string provinceofbirth;
        string countryofbirth;
        string countyofcitizenship;
        string father_surname;
        string father_forenames;
        string mother_surname;
        string mother_forenames;
        string immigrant_countryofcitizenship;
        string citizenship_ofothercountrylocation;
        string citizenship_ofothercountryreason;
        string citizenship_ofothercountrylocationissued;
        string marriagepartner_forenames;
        string marriagepartner_maidenname;
        string marriagepartner_townmarried;
        string id_remark;

        string birthcert_appreason,
        string birthcert_type,
        string birthcert_personconcerned_surname,
        string birthcert_personconcerned_maidenname,
        string birthcert_personconcerned_forenames,
        string birthcert_personconcerned_provinceofbirth,
        string birthcert_personconcerned_townofbirth,
        string birthcert_personconcerned_father_surname,
        string birthcert_personconcerned_father_forenames,
        string birthcert_personconcerned_mother_surname,
        string birthcert_personconcerned_mother_forenames;
        uint birthcert_personconcerned_dateofbirth;
        uint birthcert_personconcerned_idenitynumber;
        uint birthcert_personconcerned_birthentrynumber;

        uint immigrant_residencepermitnumber;
        uint immigrant_dateofpermanententry;
        uint naturalization_certificatenumber;
        uint naturalization_dateofissuance;
        uint citizenship_ofothercountrydate;
        uint marriagepartner_identitynumber;
        uint marriagepartner_dateofbirth;
        uint marriagepartner_dateofmarriage;
        uint dateofbirth;
        uint identitynumber;
        uint passportnumber;
        uint birthentrynumber;
        uint postalcode;
        uint residentialcode;
        uint homenumber;
        uint hometelcode;
        uint worknumber;
        uint worktelcode;
        uint cellnumber;
        uint cellcode;
        uint idcardnumber;
        uint tbvc_idnumber;

        // False for Female; True for Male
        bool gender;
        bool id_lateregistration;
        bool tbvc;
        bool naturalization_acquiredbeforedate;
        bool citizenship_ofothercountry;
        // Used to identify whether person has their general information saved
        bool hasgeneralinformationsaved = false;
        // Used to identify whether person has their id information saved
        bool hasidentityinformationsaved = false;
        // Used to identify whether person has their birthcertificate information saved
        bool hasbirthcertificateinformationsaved = false;

        // Used to keep track of transaction ID containing latest information saved to autofill all fields in birth certificate form
        // where the person concerned is the application user
        byte32 birthcert_owninfo_transactionID;
    }

    // Returns whether the person's general information has been saved yet or not
    function getGeneralInformationSaved() external view returns (bool){
        return hasgeneralinformationsaved;
    }

    // Returns whether the person's ID information has been saved yet or not
    function getIDInformationSaved() external view returns (bool){
        return hasidentityinformationsaved;
    }

    // Returns whether the person's birth certificate information has been saved yet or not
    function getGeneralInformationSaved() external view returns (bool){
        return hasbirthcertificateinformationsaved;
    }


    function saveGeneralInformation(string _forenames, string _surname, string _prevsurnames, string _maidenname, string _gender, string _maritualstatus, string _countryofbirth, string _townofbirth, string _nationality, string _postalstreetaddress, string _postalsuburbaddress, string _postalcityaddress, uint _postalcode, uint _dateofbirth, uint _identitynumber, uint _passportnumber, uint _homenumber, uint _hometelcode, uint _worknumber, uint worktelcode, uint _cellnumber, uint cellcode, bool _gender)
    {
        forenames = _forenames;
        surname = _surname;
        prevsurnames = _prevsurnames;
        maidenname = _maidenname;
        gender = _gender;
        maritualstatus = _maritualstatus;
        dateofbirth = _dateofbirth;
        countryofbirth = _countryofbirth;
        townofbirth = _townofbirth;
        nationality = _nationality;
        postalstreetaddress = _postalstreetaddress;
        postalsuburbaddress = _postalsuburbaddress;
        postalcityaddress = _postalcityaddress;
        postalcode = _postalcode
        identitynumber = _identitynumber;
        passportnumber = _passportnumber;
        homenumber = _homenumber;
        hometelcode = _hometelcode;
        worknumber = _worknumber;
        worktelcode = _worktelcode;
        cellnumber = _cellnumber;
        cellcode = _cellcode;
        gender = _gender;
        hasgeneralinformationsaved = true;
    }

    // Returns general information used in application forms
    function getGeneralInformation() external view returns (string, string, string, string, string, string, string, string, string, string, string, uint, uint, uint, uint, uint, uint, uint, uint, uint, bool){
        return (forenames, surname, prevsurnames, maidenname, maritualstatus, countryofbirth, townofbirth, nationality, postalstreetaddress, postalsuburbaddress, postalcityaddress, postalcode, identitynumber, passportnumber, homenumber, hometelcode, worknumber, worktelcode, cellnumber, cellcode, gender);
    }

    // Saves the information needed from a person for an identity document
    function personIDFormInformation(string _forenames, string _surname, string _maidenname, string _maritualstatus, string _countryofbirth, string _townofbirth, string _postalstreetaddress, string _postalsuburbaddress, string _postalcityaddress, string _residentialstreetaddress, string _residentialsuburbaddress, string _residentialcityaddress, string _immigrant_countryofcitizenship, string _citizenship_ofothercountrylocation, string _citizenship_ofothercountryreason, string _citizenship_ofothercountrylocationissued, string _marriagepartner_forenames, string _marriagepartner_maidenname, string _marriagepartner_townmarried, string _id_remark, uint _postalcode, uint _residentialcode, uint _identitynumber, uint _birthentrynumber, uint _dateofbirth, uint _immigrant_dateofpermanententry, uint _citizenship_ofothercountrydate, uint _homenumber, uint _hometelcode, uint _cellnumber, uint _cellcode, uint _marriagepartner_identitynumber, uint _marriagepartner_dateofbirth, uint _marriagepartner_dateofmarriage, uint _immigrant_residencepermitnumber, uint _naturalization_certificatenumber, uint _naturalization_dateofissuance, uint _idcardnumber, uint _tbvc_idnumber, bool _gender, bool _id_lateregistration, bool _tbvc, bool _naturalization_acquiredbeforedate, bool _citizenehip_ofothercountry) {
        forenames = _forenames;
        surname = _surname;
        maidenname = _maidenname;
        maritualstatus = _maritualstatus;
        countryofbirth = _countryofbirth;
        townofbirth = _townofbirth;
        postalstreetaddress = _postalstreetaddress;
        postalsuburbaddress = _postalsuburbaddress;
        postalcityaddress = _postalcityaddress;
        residentialstreetaddress = _residentialstreetaddress;
        residentialsuburbaddress = _residentialsuburbaddress;
        residentialcityaddress = _residentialcityaddress;
        immigrant_countryofcitizenship = _immigrant_countryofcitizenship;
        citizenship_ofothercountrylocation = _citizenship_ofothercountrylocation;
        citizenship_ofothercountryreason = _citizenship_ofothercountryreason;
        citizenship_ofothercountrylocationissued = _citizenship_ofothercountrylocationissued;
        marriagepartner_forenames = _marriagepartner_forenames;
        marriagepartner_maidenname = _marriagepartner_maidenname;
        marriagepartner_townmarried = _marriagepartner_townmarried;
        id_remark = _id_remark;
        postalcode = _postalcode;
        residentialcode = _residentialcode;
        identitynumber = _identitynumber;
        birthentrynumber = _birthentrynumber;
        dateofbirth = _dateofbirth;
        homenumber = _homenumber;
        hometelcode = _hometelcode;
        cellnumber = _cellnumber;
        cellcode = _cellcode;
        marriagepartner_identitynumber = _marriagepartner_identitynumber;
        marriagepartner_dateofmarriage = _marriagepartner_dateofmarriage;
        marriagepartner_dateofbirth = _marriagepartner_dateofbirth;
        immigrant_residencepermitnumber = _immigrant_residencepermitnumber;
        immigrant_dateofpermanententry = _immigrant_dateofpermanententry;
        naturalization_certificatenumber = _naturalization_certificatenumber;
        naturalization_dateofissuance = _naturalization_dateofissuance;
        citizenship_ofothercountrydate = citizenship_ofothercountrydate;
        idcardnumber = _idcardnumber;
        tbvc_idnumber = _tbvc_idnumber;
        gender = _gender;
        id_lateregistration = _id_lateregistration;
        tbvc = _tbvc;
        naturalization_acquiredbeforedate = _naturalization_acquiredbeforedate;
        citizenship_ofothercountry = _citizenehip_ofothercountry;
        hasidentityinformationsaved = true;
    }

    // Returns the information of a person for an identity document
    function getIDFormInformation() external view returns(string, string, string, string, string, string, string, string, string, string, string, string, string, string, string, string, string, string, string, string, uint, uint, uint, uint , uint, uint, uint, uint, uint, uint, uint, uint, uint, uint, uint, uint, uint _naturalization_dateofissuance, uint, uint, bool, bool, bool, bool, bool) {
        return(forenames, surname, maidenname, maritualstatus, countryofbirth, townofbirth, postalstreetaddress, postalsuburbaddress, postalcityaddress, residentialstreetaddress, residentialsuburbaddress, residentialcityaddress, immigrant_countryofcitizenship, citizenship_ofothercountrylocation, citizenship_ofothercountryreason, citizenship_ofothercountrylocationissued, marriagepartner_forenames, marriagepartner_maidenname, marriagepartner_townmarried, id_remark, postalcode, residentialcode, identitynumber, birthentrynumber, dateofbirth, immigrant_dateofpermanententry, citizenship_ofothercountrydate, homenumber, hometelcode, cellnumber, cellcode, marriagepartner_identitynumber, marriagepartner_dateofbirth, marriagepartner_dateofmarriage, immigrant_residencepermitnumber, naturalization_certificatenumber, naturalization_dateofissuance, idcardnumber, tbvc_idnumber, gender, id_lateregistration, tbvc, naturalization_acquiredbeforedate, citizenehip_ofothercountry);
    }

    // Saves the information needed from a person for a birth certificate
    function saveBirthCertificate(string _birthcert_appreason, string _birthcert_type, string _birthcert_personconcerned_surname, string _birthcert_personconcerned_maidenname, string _birthcert_personconcerned_forenames, string _birthcert_personconcerned_provinceofbirth, string _birthcert_personconcerned_townofbirth, string _birthcert_personconcerned_father_surname, string _birthcert_personconcerned_father_forenames, string _birthcert_personconcerned_mother_surname, string _birthcert_personconcerned_mother_forenames, string _surname, string _forenames, string _postalstreetaddress, string _postalsuburbaddress, string _postalcityaddress, uint _postalcode, uint _homenumber, uint _hometelcode, uint _worknumber, uint _worktelcode, uint _birthcert_personconcerned_dateofbirth, uint _birthcert_personconcerned_identitynumber, uint _birthcert_personconcerned_birthentrynumber){
        birthcert_appreason = _birthcert_appreason;
        birthcert_type= _birthcert_type;
        birthcert_personconcerned_surname = _birthcert_personconcerned_surname;
        birthcert_personconcerned_maidenname = _birthcert_personconcerned_maidenname;
        birthcert_personconcerned_forenames = _birthcert_personconcerned_forenames;
        birthcert_personconcerned_provinceofbirth = _birthcert_personconcerned_provinceofbirth;
        birthcert_personconcerned_townofbirth = _birthcert_personconcerned_townofbirth;
        birthcert_personconcerned_father_surname = _birthcert_personconcerned_father_surname;
        birthcert_personconcerned_father_forenames = _birthcert_personconcerned_father_forenames;
        birthcert_personconcerned_mother_surname = _birthcert_personconcerned_mother_surname;
        birthcert_personconcerned_mother_forenames = _birthcert_personconcerned_mother_forenames;
        surname = _surname;
        forenames = _forenames;
        postalstreetaddress = _postalstreetaddress;
        postalsuburbaddress = _postalsuburbaddress;
        postalcityaddress = _postalcityaddress;
        postalcode = _postalcode;
        homenumber = _homenumber;
        hometelcode = _hometelcode;
        worknumber = _worknumber;
        worktelcode = _worktelcode;
        birthcert_personconcerned_dateofbirth = _birthcert_personconcerned_dateofbirth;
        birthcert_personconcerned_idenitynumber = _birthcert_personconcerned_identitynumber;
        birthcert_personconcerned_birthentrynumber = _birthcert_personconcerned_birthentrynumber;
        hasbirthcertificateinformationsaved = true;
    }

    // Returns the information of a person for a birth certificate
    function saveBirthCertificate() external view returns (string, string, string, string, string, string, string, string, string, string, string, string, string, string, string, string, uint, uint, uint, uint, uint, uint, uint, uint) {
        return(birthcert_appreason, birthcert_type, birthcert_personconcerned_surname, birthcert_personconcerned_maidenname, birthcert_personconcerned_forenames, birthcert_personconcerned_provinceofbirth, birthcert_personconcerned_townofbirth, birthcert_personconcerned_father_surname, birthcert_personconcerned_father_forenames, birthcert_personconcerned_mother_surname, birthcert_personconcerned_mother_forenames, surname, forenames, postalstreetaddress, postalsuburbaddress, postalcityaddress, postalcode, homenumber, hometelcode, worknumber, worktelcode, birthcert_personconcerned_dateofbirth, birthcert_personconcerned_identitynumber, birthcert_personconcerned_birthentrynumber);
    }
}
