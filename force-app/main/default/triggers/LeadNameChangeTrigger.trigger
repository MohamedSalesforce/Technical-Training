trigger LeadNameChangeTrigger on Lead (after update) {
    List<Lead> updatedLeads = new List<Lead>();

    for (Lead newLead : Trigger.new) {
        Lead oldLead = (Lead) Trigger.oldMap.get(newLead.Id);

        if (newLead.Name != oldLead.Name) {
            updatedLeads.add(newLead);
        }
    }

    if (!updatedLeads.isEmpty()) {
        LeadNameChangeLogger queueableLogger = new LeadNameChangeLogger(updatedLeads);
        System.enqueueJob(queueableLogger);
    }
}
