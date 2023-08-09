trigger IntegrationLogTrigger on Integration_Log__c (after insert) {
    for(Integration_Log__c job: trigger.new){
        System.enqueueJob(new ProcessIntegrationData(job.id));
    }
    
}  