public with sharing class AccountFetch {
    @AuraEnabled
    public static List<Account> getFiveAccounts()
    {
        List<Account> accountList = [SELECT Id, Name FROM Account LIMIT 5];
        return accountList;
    }
}