trigger Task1 on Opportunity (after insert, after update, after delete) {
    Set<Id> accountIds = new Set<Id>();
    
    if (Trigger.isInsert || Trigger.isUpdate) {
        for (Opportunity opp : Trigger.new) {
            if (opp.StageName == 'Closed Won') {
                accountIds.add(opp.AccountId);
            }
        }
    } else if (Trigger.isDelete) {
        for (Opportunity opp : Trigger.old) {
            if (opp.StageName == 'Closed Won') {
                accountIds.add(opp.AccountId);
            }
        }
    }
    
    List<Account> accountsToUpdate = new List<Account>();
    for (Id accountId : accountIds) {
        List<Opportunity> amountList = [SELECT Amount FROM Opportunity WHERE AccountId = :accountId AND StageName = 'Closed Won'];
        Decimal opportunityWonTotal = 0;
        for (Opportunity opp : amountList) {
            opportunityWonTotal += opp.Amount;
        }
        accountsToUpdate.add(new Account(Id = accountId, OpportunityWonTotal__c = opportunityWonTotal));
    }
    
    if (!accountsToUpdate.isEmpty()) {
        update accountsToUpdate;
    }
}