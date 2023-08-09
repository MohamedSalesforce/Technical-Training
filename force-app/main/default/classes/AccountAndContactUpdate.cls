public with sharing class AccountAndContactUpdate implements Database.Batchable<sObject> {
    public AccountAndContactUpdate() {
    
    }
    
    public Database.QueryLocator start(Database.BatchableContext BC) {
        // Query to retrieve Account records with null Custom_Random_Number__c
        String query = 'SELECT Id, Custom_Random_Number__c,(SELECT Id , Custom_Random_Number__c FROM Contacts) FROM Account';
        return Database.getQueryLocator(query);
    }

// List to store Contacts that need to be updated
    public void execute(Database.BatchableContext BC, List<Account> scope) {
        List<Contact> contactsToUpdate = new List<Contact>();
// Loop through each Account in the batch scope        
        for (Account acc : scope) {
// Generate a random number for the Account            
            Integer randomNumber = generateRandomNumber();
// Update the Account's Custom_Random_Number__c field
            acc.Custom_Random_Number__c = randomNumber;
//Contacts associated with the Account            
            for (Contact con : acc.Contacts) {
                con.Custom_Random_Number__c = randomNumber;
                contactsToUpdate.add(con);
            }
        }
// Update the modified Contacts if there are any        
                if (!contactsToUpdate.isEmpty()) {
                    update contactsToUpdate;
                }
// Update the modified Accounts                
                if (!scope.isEmpty()) {
                    update scope;
                }
    }

// This method is executed after all batches are processed
    public void finish(Database.BatchableContext BC) {
    }

// Generates a random number between 0 and 10000    
    public static Integer generateRandomNumber() {
        return (Integer)Math.floor(Math.random() * 10001);
    }
}