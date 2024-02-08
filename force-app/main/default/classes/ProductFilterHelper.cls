public with sharing class ProductFilterHelper {
    @AuraEnabled(cacheable=true)
    public static List<Product2> searchProducts(String productFamily) {
        String searchQuery = 'SELECT Product_Image__c, Name, Description, Family FROM Product2 WHERE Family = :productFamily';
        return Database.query(searchQuery);
    }
}