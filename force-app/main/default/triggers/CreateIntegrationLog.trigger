trigger CreateIntegrationLog on Lead (after insert) {
    List<Integration_Log__c> queueableJobs = new List<Integration_Log__c>();
    
    for (Lead newLead : Trigger.new) {
        Integration_Log__c job = new Integration_Log__c();
        job.Request_Body__c = newLead.Name;
        job.Related_Lead__c = newLead.id;
        queueableJobs.add(job);
    }
    insert queueableJobs;
}