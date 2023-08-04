public with sharing class ContactLeadMerge {
    public static void relateContactToLead(Id contactId, Id leadId) {
        Contact contactRecord = [SELECT Id, Email, AccountId FROM Contact WHERE Id = :contactId];
        Lead leadRecord = [SELECT Id, Email FROM Lead WHERE Id = :leadId];
        if (contactRecord.Email != null && leadRecord.Email != null) {
            if (contactRecord.Email == leadRecord.Email) {
                contactRecord.AccountId = leadId;
                update contactRecord;
            }
        }
    }
}