public with sharing class Country {
    public static String getCountryName(String cityName){
        Map<String,String> cityToState = new Map<String,String>();
        Map<String,String> stateToCountry = new Map<String,String>();
        for(State__c state: [Select State_Name__c,City__c From State__c]) {
            cityToState.put(state.City__c,state.State_Name__c);
        }
        for(Country__c country: [Select Country__c,State_Name__c From Country__c]) {
            cityToState.put(country.Country__c,country.State_Name__c);
        }
        try{
        String relatedState = cityToState.get(cityName);
        String relatedCountry = stateToCountry.get(relatedState);
        return relatedCountry;
        }
        catch(DmlException exceptionError){
            return 'DmlException';
        }
        catch(NullPointerException exceptionError){
            return 'NullPointerException';
        }
        catch(exception exceptionError){
            return 'Default';
        }
    }
    public static void mapLeadOnContact(Id contactId){
    String emailId;

    }
}