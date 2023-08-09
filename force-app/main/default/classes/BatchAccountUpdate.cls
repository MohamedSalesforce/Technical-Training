public with sharing class BatchAccountUpdate implements Database.Batchable<sObject>{
    public BatchAccountUpdate() {
   
    }
   
    public Database.QueryLocator start(Database.BatchableContext context) {
        String accountsToUpdate = 'SELECT Id, Is_Updated__c from Account WHERE Is_Updated__c=false';
        return Database.getQueryLocator(accountsToUpdate);
    }

    public void execute(Database.BatchableContext context, List<sObject> accountsToUpdate) {
        for (Account accountToUpdate : (List<Account>)accountsToUpdate){
        accountToUpdate.Is_Updated__c = false;
        } 
        update accountsToUpdate;
    }

    public void finish(Database.BatchableContext context) {
    
    }
}