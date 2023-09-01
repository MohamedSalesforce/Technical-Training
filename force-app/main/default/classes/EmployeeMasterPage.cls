public with sharing class EmployeeMasterPage {
    @AuraEnabled(cacheable=true)
    public static List<Contact> returnGetContact(){
        List<Contact> tenCon= [Select LastName,Email,Phone From Contact Limit 5];
        return tenCon;
    }
}