trigger LeadTrigger on Lead (after update) {
    List<Id> updatedLeadIds = new List<Id>();
    
    for (Lead lead : Trigger.new) {
        Lead oldLead = Trigger.oldMap.get(lead.Id);
        if (lead.Name != oldLead.Name) {
            updatedLeadIds.add(lead.Id);
        }
    }
    
    if (!updatedLeadIds.isEmpty()) {
        FieldChangeTrackingSetting__mdt setting = [SELECT ObjectApiName__c, FieldApiName__c FROM FieldChangeTrackingSetting__mdt LIMIT 1];
        
        if (setting != null) {
            String objectApiName = setting.ObjectApiName__c;
            String fieldApiName = setting.FieldApiName__c;
            
            for (Id leadId : updatedLeadIds) {
                FieldChangeTracker tracker = new FieldChangeTracker(leadId, objectApiName, fieldApiName);
                System.enqueueJob(tracker);
            }
        }
    }
}
