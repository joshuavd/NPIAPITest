@IsTest
public class JSON2Apex_Test {
    
    static testMethod void testParse() {
        String json = '{\"result_count\":1, \"results\":[{\"enumeration_type\": \"NPI-1\", \"number\": 1902863541, \"last_updated_epoch\": 1478517450, \"created_epoch\": 1146096000, \"basic\": {\"name_prefix\": \"MS.\", \"first_name\": \"HEIDI\", \"last_name\": \"OSTER\", \"middle_name\": \"JO\", \"credential\": \"M.D.\", \"sole_proprietor\": \"NO\", \"gender\": \"F\", \"enumeration_date\": \"2006-04-27\", \"last_updated\": \"2016-11-07\", \"status\": \"A\", \"name\": \"OSTER HEIDI\"}, \"other_names\": [{\"code\": \"1\", \"type\": \"Former Name\", \"last_name\": \"JATANA\", \"first_name\": \"HEIDI\", \"middle_name\": \"JO\", \"prefix\": \"MRS.\", \"credential\": \"M.D.\"}], \"addresses\": [{\"country_code\": \"US\", \"country_name\": \"United States\", \"address_purpose\": \"LOCATION\", \"address_type\": \"DOM\", \"address_1\": \"10099 RIDGE GATE PARKWAY, SUITE 280\", \"address_2\": \"\", \"city\": \"LONE TREE\", \"state\": \"CO\", \"postal_code\": \"80124\", \"telephone_number\": \"303-791-2112\", \"fax_number\": \"303-683-6415\"}, {\"country_code\": \"US\", \"country_name\": \"United States\", \"address_purpose\": \"MAILING\", \"address_type\": \"DOM\", \"address_1\": \"10099 RIDGE GATE PARKWAY, SUITE 280\", \"address_2\": \"\", \"city\": \"LONE TREE\", \"state\": \"CO\", \"postal_code\": \"80124\", \"telephone_number\": \"303-791-2112\", \"fax_number\": \"303-683-6415\"}], \"taxonomies\": [{\"code\": \"207V00000X\", \"desc\": \"Obstetrics & Gynecology\", \"primary\": true, \"state\": \"CO\", \"license\": \"37061\"}], \"identifiers\": [{\"identifier\": \"53704258\", \"code\": \"05\", \"desc\": \"MEDICAID\", \"state\": \"CO\", \"issuer\": \"\"}]}]}';
        JSON2Apex r = JSON2Apex.parse(json);
        System.assert(r != null);

        json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
        JSON2Apex.Addresses objAddresses = new JSON2Apex.Addresses(System.JSON.createParser(json));
        System.assert(objAddresses != null);
        System.assert(objAddresses.country_code == null);
        System.assert(objAddresses.country_name == null);
        System.assert(objAddresses.address_purpose == null);
        System.assert(objAddresses.address_type == null);
        System.assert(objAddresses.address_1 == null);
        System.assert(objAddresses.address_2 == null);
        System.assert(objAddresses.city == null);
        System.assert(objAddresses.state == null);
        System.assert(objAddresses.postal_code == null);
        System.assert(objAddresses.telephone_number == null);
        System.assert(objAddresses.fax_number == null);

        json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
        JSON2Apex.Basic objBasic = new JSON2Apex.Basic(System.JSON.createParser(json));
        System.assert(objBasic != null);
        System.assert(objBasic.name_prefix == null);
        System.assert(objBasic.first_name == null);
        System.assert(objBasic.last_name == null);
        System.assert(objBasic.middle_name == null);
        System.assert(objBasic.credential == null);
        System.assert(objBasic.sole_proprietor == null);
        System.assert(objBasic.gender == null);
        System.assert(objBasic.enumeration_date == null);
        System.assert(objBasic.last_updated == null);
        System.assert(objBasic.status == null);
        System.assert(objBasic.name == null);

        json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
        JSON2Apex.Taxonomies objTaxonomies = new JSON2Apex.Taxonomies(System.JSON.createParser(json));
        System.assert(objTaxonomies != null);
        System.assert(objTaxonomies.code == null);
        System.assert(objTaxonomies.desc_Z == null);
        System.assert(objTaxonomies.primary == null);
        System.assert(objTaxonomies.state == null);
        System.assert(objTaxonomies.license == null);

        json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
        JSON2Apex objJSON2Apex = new JSON2Apex(System.JSON.createParser(json));
        System.assert(objJSON2Apex != null);
        System.assert(objJSON2Apex.result_count == null);
        System.assert(objJSON2Apex.results == null);

        json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
        JSON2Apex.Other_names objOther_names = new JSON2Apex.Other_names(System.JSON.createParser(json));
        System.assert(objOther_names != null);
        System.assert(objOther_names.code == null);
        System.assert(objOther_names.type_Z == null);
        System.assert(objOther_names.last_name == null);
        System.assert(objOther_names.first_name == null);
        System.assert(objOther_names.middle_name == null);
        System.assert(objOther_names.prefix == null);
        System.assert(objOther_names.credential == null);

        json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
        JSON2Apex.Results objResults = new JSON2Apex.Results(System.JSON.createParser(json));
        System.assert(objResults != null);
        System.assert(objResults.enumeration_type == null);
        System.assert(objResults.number_Z == null);
        System.assert(objResults.last_updated_epoch == null);
        System.assert(objResults.created_epoch == null);
        System.assert(objResults.basic == null);
        System.assert(objResults.other_names == null);
        System.assert(objResults.addresses == null);
        System.assert(objResults.taxonomies == null);
        System.assert(objResults.identifiers == null);

        json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
        JSON2Apex.Identifiers objIdentifiers = new JSON2Apex.Identifiers(System.JSON.createParser(json));
        System.assert(objIdentifiers != null);
        System.assert(objIdentifiers.identifier == null);
        System.assert(objIdentifiers.code == null);
        System.assert(objIdentifiers.desc_Z == null);
        System.assert(objIdentifiers.state == null);
        System.assert(objIdentifiers.issuer == null);
    }
}