public with sharing class CaseHandler {
    public static void insertLatestCaseNumber(List<Case> listOfCase){
        List<Account> accountToBeInserted = New List<Account>();
        for(Case cs : listOfCase){
            if(cs.AccountId != null){
                Account acc = new Account();
                acc.Id = cs.AccountId;
                acc.Latest_Case_Number__c = cs.CaseNumber;
                accountToBeInserted.add(acc);
            } 
        }
        if(!accountToBeInserted.isEmpty()){
            update accountToBeInserted;
        }
    }
}