public with sharing class AccAndConRandomNumber implements Database.Batchable<sObject> {
    public AccAndConRandomNumber() {

    }
    public static Integer generateAndStoreRandomNumber() {
        Integer randomNumber = (Integer)Math.floor(Math.random() * 10001);
        System.debug('Generated and stored random number: ' + randomNumber);
        return randomNumber;
    }

    public Database.QueryLocator start(Database.BatchableContext BC) {
        String query = 'SELECT Id FROM Account WHERE Custom_Random_Number__c = null LIMIT 1';
        return Database.getQueryLocator(query);
    }

    public void execute(Database.BatchableContext BC, List<Account> scope) {
        if (scope.isEmpty()) {
            return;
        }

        Integer randomNumber = generateAndStoreRandomNumber();

        Account acc = new Account();
        acc.Custom_Random_Number__c = randomNumber;
        
        Contact con = new Contact();
        con.AccountId = acc.Id;
        con.Custom_Random_Number__c = randomNumber;

        List<sObject> recordsToUpdate = new List<sObject>{ acc, con };
        update recordsToUpdate;
    }
    public void finish(Database.BatchableContext BC) {
    }
}