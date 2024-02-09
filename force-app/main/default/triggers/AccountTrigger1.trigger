trigger AccountTrigger1 on Account (before insert, before update, after insert) {
    // switch on operationType{
    //     when BEFORE_INSERT{
    //         AccountHandler.ratingUpdate(Trigger.new);
    //     }
    // }
    if(Trigger.isInsert){
        if(Trigger.isBefore){
            AccountHandler.ratingUpdate(Trigger.new);
        }
    }
    if(Trigger.isInsert){
        if(Trigger.isBefore){
            AccountHandler.updateBillingToShipping(Trigger.new);
        }
    }
    if(Trigger.isUpdate){
        if(Trigger.isBefore){
            AccountHandler.updateBillingToShipping(Trigger.new);
        }
    }
    if(Trigger.isInsert){
        if(Trigger.isAfter){
            AccountHandler.createRelatedContactForAccount(Trigger.new);
        }
    }
    if(Trigger.isInsert){
        if(Trigger.isAfter){
            AccountHandler.createRelatedOpportunityForAccount(Trigger.new);
        }
    }
}