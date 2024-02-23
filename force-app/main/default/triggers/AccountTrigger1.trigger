trigger AccountTrigger1 on Account (before insert, before update, after insert) {

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
    
    // description : *** update the trigger event above the trigger area ***
    // if(Trigger.isDelete){
    //     if(Trigger.isBefore){
    //         AccountHandler.preventDeletionOfAccount(Trigger.old);
    //     }
    // }
}