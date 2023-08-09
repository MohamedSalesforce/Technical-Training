public class LeadNameChangeLogger implements Queueable{
    public List<Lead> updatedLeads;
    
    public LeadNameChangeLogger(List<Lead> updatedLeads) {
        this.updatedLeads = updatedLeads;
    }

    public void execute(QueueableContext context) {
        List<Lead_Name_Change_Log__c> logs = new List<Lead_Name_Change_Log__c>();

        for (Lead newLead : updatedLeads) {
            Lead oldLead = Trigger.oldMap.get(newLead.Id);

            if (newLead.Name != oldLead.Name) {
                Lead_Name_Change_Log__c log = new Lead_Name_Change_Log__c();
                log.Lead_log__c = newLead.Id;
                log.Old_Name__c = oldLead.Name;
                log.New_Name__c = newLead.Name;
                log.Changed_By__c = UserInfo.getUserId();
                log.Changed_At__c = System.now();
                logs.add(log);
            }
        }

        if (!logs.isEmpty()) {
            insert logs;
        }
    }
}
