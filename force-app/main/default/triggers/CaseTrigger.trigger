trigger CaseTrigger on Case (after insert) {
    if(Trigger.isInsert){
        if(Trigger.isAfter){
            CaseHandler.insertLatestCaseNumber(Trigger.new);
        }
    }
}