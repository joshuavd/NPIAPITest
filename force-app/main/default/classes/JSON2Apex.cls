public class JSON2Apex {
    public Integer result_count {get;set;} 
    public List<Results> results {get;set;} 

    public class Addresses {
        public String country_code {get;set;} 
        public String country_name {get;set;} 
        public String address_purpose {get;set;} 
        public String address_type {get;set;} 
        public String address_1 {get;set;} 
        public String address_2 {get;set;} 
        public String city {get;set;} 
        public String state {get;set;} 
        public String postal_code {get;set;} 
        public String telephone_number {get;set;} 
        public String fax_number {get;set;} 

        public Addresses(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'country_code') {
                            country_code = parser.getText();
                        } else if (text == 'country_name') {
                            country_name = parser.getText();
                        } else if (text == 'address_purpose') {
                            address_purpose = parser.getText();
                        } else if (text == 'address_type') {
                            address_type = parser.getText();
                        } else if (text == 'address_1') {
                            address_1 = parser.getText();
                        } else if (text == 'address_2') {
                            address_2 = parser.getText();
                        } else if (text == 'city') {
                            city = parser.getText();
                        } else if (text == 'state') {
                            state = parser.getText();
                        } else if (text == 'postal_code') {
                            postal_code = parser.getText();
                        } else if (text == 'telephone_number') {
                            telephone_number = parser.getText();
                        } else if (text == 'fax_number') {
                            fax_number = parser.getText();
                        } else {
                            System.debug(LoggingLevel.WARN, 'Addresses consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class Basic {
        public String name_prefix {get;set;} 
        public String first_name {get;set;} 
        public String last_name {get;set;} 
        public String middle_name {get;set;} 
        public String credential {get;set;} 
        public String sole_proprietor {get;set;} 
        public String gender {get;set;} 
        public String enumeration_date {get;set;} 
        public String last_updated {get;set;} 
        public String status {get;set;} 
        public String name {get;set;} 

        public Basic(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'name_prefix') {
                            name_prefix = parser.getText();
                        } else if (text == 'first_name') {
                            first_name = parser.getText();
                        } else if (text == 'last_name') {
                            last_name = parser.getText();
                        } else if (text == 'middle_name') {
                            middle_name = parser.getText();
                        } else if (text == 'credential') {
                            credential = parser.getText();
                        } else if (text == 'sole_proprietor') {
                            sole_proprietor = parser.getText();
                        } else if (text == 'gender') {
                            gender = parser.getText();
                        } else if (text == 'enumeration_date') {
                            enumeration_date = parser.getText();
                        } else if (text == 'last_updated') {
                            last_updated = parser.getText();
                        } else if (text == 'status') {
                            status = parser.getText();
                        } else if (text == 'name') {
                            name = parser.getText();
                        } else {
                            System.debug(LoggingLevel.WARN, 'Basic consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class Taxonomies {
        public String code {get;set;} 
        public String desc_Z {get;set;} // in json: desc
        public Boolean primary {get;set;} 
        public String state {get;set;} 
        public String license {get;set;} 

        public Taxonomies(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'code') {
                            code = parser.getText();
                        } else if (text == 'desc') {
                            desc_Z = parser.getText();
                        } else if (text == 'primary') {
                            primary = parser.getBooleanValue();
                        } else if (text == 'state') {
                            state = parser.getText();
                        } else if (text == 'license') {
                            license = parser.getText();
                        } else {
                            System.debug(LoggingLevel.WARN, 'Taxonomies consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public JSON2Apex(JSONParser parser) {
        while (parser.nextToken() != System.JSONToken.END_OBJECT) {
            if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                String text = parser.getText();
                if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                    if (text == 'result_count') {
                        result_count = parser.getIntegerValue();
                    } else if (text == 'results') {
                        results = arrayOfResults(parser);
                    } else {
                        System.debug(LoggingLevel.WARN, 'JSON2Apex consuming unrecognized property: '+text);
                        consumeObject(parser);
                    }
                }
            }
        }
    }
    
    public class Other_names {
        public String code {get;set;} 
        public String type_Z {get;set;} // in json: type
        public String last_name {get;set;} 
        public String first_name {get;set;} 
        public String middle_name {get;set;} 
        public String prefix {get;set;} 
        public String credential {get;set;} 

        public Other_names(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'code') {
                            code = parser.getText();
                        } else if (text == 'type') {
                            type_Z = parser.getText();
                        } else if (text == 'last_name') {
                            last_name = parser.getText();
                        } else if (text == 'first_name') {
                            first_name = parser.getText();
                        } else if (text == 'middle_name') {
                            middle_name = parser.getText();
                        } else if (text == 'prefix') {
                            prefix = parser.getText();
                        } else if (text == 'credential') {
                            credential = parser.getText();
                        } else {
                            System.debug(LoggingLevel.WARN, 'Other_names consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class Results {
        public String enumeration_type {get;set;} 
        public Integer number_Z {get;set;} // in json: number
        public Integer last_updated_epoch {get;set;} 
        public Integer created_epoch {get;set;} 
        public Basic basic {get;set;} 
        public List<Other_names> other_names {get;set;} 
        public List<Addresses> addresses {get;set;} 
        public List<Taxonomies> taxonomies {get;set;} 
        public List<Identifiers> identifiers {get;set;} 

        public Results(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'enumeration_type') {
                            enumeration_type = parser.getText();
                        } else if (text == 'number') {
                            number_Z = parser.getIntegerValue();
                        } else if (text == 'last_updated_epoch') {
                            last_updated_epoch = parser.getIntegerValue();
                        } else if (text == 'created_epoch') {
                            created_epoch = parser.getIntegerValue();
                        } else if (text == 'basic') {
                            basic = new Basic(parser);
                        } else if (text == 'other_names') {
                            other_names = arrayOfOther_names(parser);
                        } else if (text == 'addresses') {
                            addresses = arrayOfAddresses(parser);
                        } else if (text == 'taxonomies') {
                            taxonomies = arrayOfTaxonomies(parser);
                        } else if (text == 'identifiers') {
                            identifiers = arrayOfIdentifiers(parser);
                        } else {
                            System.debug(LoggingLevel.WARN, 'Results consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class Identifiers {
        public String identifier {get;set;} 
        public String code {get;set;} 
        public String desc_Z {get;set;} // in json: desc
        public String state {get;set;} 
        public String issuer {get;set;} 

        public Identifiers(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'identifier') {
                            identifier = parser.getText();
                        } else if (text == 'code') {
                            code = parser.getText();
                        } else if (text == 'desc') {
                            desc_Z = parser.getText();
                        } else if (text == 'state') {
                            state = parser.getText();
                        } else if (text == 'issuer') {
                            issuer = parser.getText();
                        } else {
                            System.debug(LoggingLevel.WARN, 'Identifiers consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    
    public static JSON2Apex parse(String json) {
        System.JSONParser parser = System.JSON.createParser(json);
        return new JSON2Apex(parser);
    }
    
    public static void consumeObject(System.JSONParser parser) {
        Integer depth = 0;
        do {
            System.JSONToken curr = parser.getCurrentToken();
            if (curr == System.JSONToken.START_OBJECT || 
                curr == System.JSONToken.START_ARRAY) {
                depth++;
            } else if (curr == System.JSONToken.END_OBJECT ||
                curr == System.JSONToken.END_ARRAY) {
                depth--;
            }
        } while (depth > 0 && parser.nextToken() != null);
    }
    


    private static List<Addresses> arrayOfAddresses(System.JSONParser p) {
        List<Addresses> res = new List<Addresses>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new Addresses(p));
        }
        return res;
    }


    private static List<Identifiers> arrayOfIdentifiers(System.JSONParser p) {
        List<Identifiers> res = new List<Identifiers>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new Identifiers(p));
        }
        return res;
    }




    private static List<Results> arrayOfResults(System.JSONParser p) {
        List<Results> res = new List<Results>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new Results(p));
        }
        return res;
    }







    private static List<Other_names> arrayOfOther_names(System.JSONParser p) {
        List<Other_names> res = new List<Other_names>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new Other_names(p));
        }
        return res;
    }


    private static List<Taxonomies> arrayOfTaxonomies(System.JSONParser p) {
        List<Taxonomies> res = new List<Taxonomies>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new Taxonomies(p));
        }
        return res;
    }



}