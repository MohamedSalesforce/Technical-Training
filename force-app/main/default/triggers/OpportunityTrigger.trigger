trigger OpportunityTrigger on Opportunity (before insert, after insert) {
    if(Trigger.isInsert){
        if(Trigger.isBefore){
            OpportunityHandler.updateDescription(Trigger.new);
        }
    }
    if(Trigger.isInsert){
        if(Trigger.isAfter){
            OpportunityHandler.updateOpportunityAmount(Trigger.new);
        }
    }
}