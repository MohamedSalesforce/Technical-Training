public with sharing class ParentContact {
    @AuraEnabled
    public static List<Contact> getContacts(){
        List<Contact> tenContacts = [SELECT Name, Phone FROM Contact LIMIT 10];
        return tenContacts;
    }
}