public with sharing class ContactFetchLWC {
        @AuraEnabled(cacheable=true)
        public static List<Account> getAccountsWithContacts() {
            List<Account> accountsWithContacts = [
                SELECT Id, Name, 
                    (SELECT Id, FirstName, LastName, Email, Phone FROM Contacts) 
                FROM Account];
            // Loop through the accounts and their contacts to organize the data
            for (Account acc : accountsWithContacts) {
                List<Contact> contacts = acc.Contacts;
                if (contacts != null) {
                    acc.Contacts.addAll(contacts); // Add contacts to the related list
                }
            }
            return accountsWithContacts;
        }
}