public with sharing class DuplicateLeadQualifyPrevention {
    // public DuplicateLeadQualifyPrevention() {
    // }
    public static void leadHandler(List<Lead> qualifiedLeads){
        List<Lead> existingLeads = new List<Lead>();
        existingLeads=[SELECT Name, Company, Email FROM Lead];
        List<Account> existingAccounts = new List<Account>();
        existingAccounts=[SELECT Id, Name FROM Account]; 
        List<Contact> existingContacts = new List<Contact>();
        existingContacts=[SELECT Id, Email, LastName FROM Contact];

        for (Lead newLead : existingLeads){
            for (Account newAccount : existingAccounts){
                if(newLead.Company == newAccount.Name){
                    newLead.Company = existingAccounts.Name;
                    update existingAccounts;
                }
            }
            for(Contact newContact : existingContacts){
                if(newLead.Email == newContact.Email){
                    newLead.Name = existingContacts.LastName;
                    newLead.Email = newContact.Email;
                    update existingContacts;
                }
            }
        }
    }
}