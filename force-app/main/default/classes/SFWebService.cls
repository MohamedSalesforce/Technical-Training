global with sharing class SFWebService {
    webservice static List<Account> getAccount(String accountName) 
    {
        accountName = '%'+accountName+'%';
        List<Account> matchedAccounts = [SELECT id, name FROM Account WHERE name like : accountName];
        return matchedAccounts;
    }
}