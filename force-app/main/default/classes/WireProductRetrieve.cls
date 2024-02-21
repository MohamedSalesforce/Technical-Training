public with sharing class WireProductRetrieve {

    @AuraEnabled(cacheable = true)
    public static List<PricebookEntry> product(){
        List<PricebookEntry> productRetrieved = [SELECT Id, Name, UnitPrice FROM PricebookEntry LIMIT 5];
        return productRetrieved;
    }
}