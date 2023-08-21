public with sharing class DisplayEmployees {
    @AuraEnabled
    public static Contact createContact(String firstName, String lastName, String email, String phone){
        Contact newContact = new Contact();
        newContact.firstName=firstName;
        newContact.LastName=lastName;
        newContact.Email=email;
        newContact.Phone=phone;
        insert newContact;
        return newContact;
    }
}