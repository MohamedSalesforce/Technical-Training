public with sharing class TotalOpportunitiesAmount {
    public TotalOpportunitiesAmount() {
    trigger UpdateAccountTotalAmount on Opportunity (after insert, after update, after delete) {
    Set<Id> accountIdsToUpdate = new Set<Id>();
    
    if (Trigger.isInsert || Trigger.isUpdate) {
        for (Opportunity opp : Trigger.new) {
            if (opp.StageName == 'Closed Won') {
                accountIdsToUpdate.add(opp.AccountId);
            }
        }
    } else if (Trigger.isDelete) {
        for (Opportunity opp : Trigger.old) {
            if (opp.StageName == 'Closed Won') {
                accountIdsToUpdate.add(opp.AccountId);
            }
        }
    }
    if (!accountIdsToUpdate.isEmpty()) {
        List<Account> accountsToUpdate = new List<Account>();
        for (Id accountId : accountIdsToUpdate) {
            Decimal totalAmount = 0;
            for (Opportunity opp : [SELECT Amount FROM Opportunity WHERE AccountId = :accountId AND StageName = 'Closed Won']) {
                totalAmount += opp.Amount;
            }   
            accountsToUpdate.add(new Account(Id = accountId, OpportunityWonTotal__c = totalAmount));
        }       
        update accountsToUpdate;
    }
}
    }
}