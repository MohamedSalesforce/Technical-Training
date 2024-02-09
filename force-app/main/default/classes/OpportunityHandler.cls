public with sharing class OpportunityHandler {
    public static void updateDescription(List<Opportunity> listOfOpp){
        for(Opportunity opp : listOfOpp){
            if(opp.Amount == null || opp.Amount >= 100000){
                opp.Description = 'Hot Opportunity';
            }
        }
    }
    public static void updateOpportunityAmount(List<Opportunity> listOfOpportunity){
        List<Account> amountToBeUpdated = new List<Account>();
        for(Opportunity opp : listOfOpportunity){
            if(opp.AccountId != null){
                Account acc = new Account();
                acc.Id = opp.AccountId;
                acc.Recent_Opportunity_Amount__c = opp.Amount;
                amountToBeUpdated.add(acc);
            }
        }
        if(!amountToBeUpdated.isEmpty()){
            update amountToBeUpdated;
        }
    }
}