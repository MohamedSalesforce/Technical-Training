public with sharing class ProductRetriever {
    @AuraEnabled(cacheable=true)
    public static List<Product2> getProductsFromOpportunity(String opportunityId) {
        try {
            return [SELECT Id, Name, Description, Product_Image__c FROM Product2 WHERE Id IN (SELECT Product2Id FROM OpportunityLineItem WHERE OpportunityId = :opportunityId)];
        } catch (Exception e) {
            throw new AuraHandledException('Error: ' + e.getMessage());
        }
    }
}