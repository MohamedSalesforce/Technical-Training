trigger LeadTrigger on lead (before insert) {
    List<Lead> updatedLeads = new List<Lead>();
    
    for (Lead lead : Trigger.new) {
        Lead oldLead = Trigger.oldMap.get(lead.Id);
        if (lead.Name != oldLead.Name) {
            updatedLeads.add(lead);
        }
    }
    
    if (!updatedLeads.isEmpty()) {
        for (Lead updatedLead : updatedLeads) {
            LeadFieldChangeTracker fieldChangeTracker = new LeadFieldChangeTracker(Trigger.oldMap.get(updatedLead.Id), updatedLead);
            System.enqueueJob(fieldChangeTracker);
        }
    }
}