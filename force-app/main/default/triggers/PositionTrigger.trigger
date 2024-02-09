trigger PositionTrigger on position__c (before insert) {
    if(Trigger.isInsert){
        if(Trigger.isBefore){
            PositionHandler.updateField(Trigger.new);
        }
    }
}