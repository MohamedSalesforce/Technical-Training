public with sharing class BatchCaseDescriptionEmail implements Database.Batchable<SObject> {

    public database.QueryLocator start(Database.BatchableContext BC){
        //List<Case> caseQuery = [SELECT CaseNumber, OwnerId, Description FROM Case];
        //System.debug('The description is updated and emailed by batch apex' + caseQuery);
        return Database.getQueryLocator('SELECT CaseNumber, OwnerId FROM Case');
    }
    public void execute(Database.BatchableContext BC, List<Case> cs){
        if(cs.isEmpty()){
            return;
        }
        List<Case> caseDescriptionUpdate = new List<Case>();
        for(Case a : cs){
            a.Description = 'The Case Description is updated by batch apex';
            caseDescriptionUpdate.add(a);
        }
        update caseDescriptionUpdate;
        // return caseDescriptionUpdate;
    }
    public void finish(Database.BatchableContext BC){
        // Messaging.reserveMassEmailCapacity(200);
        // Messaging.MassEmailMessage bulkMail = new Messaging.MassEmailMessage();
        // String[] toAddress = new Srting[]{UserInfo.getUserId()};
        // String description = execute();
        AsyncApexJob a = [Select Id, Status, ExtendedStatus,NumberOfErrors, JobItemsProcessed,TotalJobItems, CreatedBy.Email    from AsyncApexJob where Id =:BC.getJobId()];
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {a.CreatedBy.Email};
        mail.setToAddresses(toAddresses);
        mail.setSubject('Match Merge Batch ' + a.Status);
        mail.setPlainTextBody('records processed ' + a.TotalJobItems +   'with '+ a.NumberOfErrors + ' failures.');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }
}