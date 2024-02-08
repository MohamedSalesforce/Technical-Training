public with sharing class AssociatedAccountForContact {
    public static void printContactNamesByAccount(List<Account> accountIds) {

        List<Account> accountsWithContacts = [SELECT Id, Name, (SELECT Id, Name FROM Contacts) FROM Account WHERE Id IN :accountIds];
    
        for (Account acc : accountsWithContacts) {
            System.debug('Account Name: ' + acc.Name);
    
            List<Contact> contacts = acc.Contacts;
            for (Contact con : contacts) {
                System.debug('  Contact Name: ' + con.Name);
            }
        }
    }
}
    