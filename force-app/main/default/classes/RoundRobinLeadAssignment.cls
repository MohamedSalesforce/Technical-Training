public with sharing class RoundRobinLeadAssignment {
    public RoundRobinLeadAssignment() {
    List<User> salesReps = [SELECT Id, Name, Region__c, Last_Lead_Index__c FROM User WHERE UserRole.Name = 'Sales Representative' AND IsActive = true ORDER BY Region__c, Last_Lead_Index__c ASC];

        Integer leadIndex = 0;
        for (Lead lead : newLeads) {
            User assignedRep = salesReps[leadIndex % salesReps.size()];
            lead.OwnerId = assignedRep.Id;
            lead.Last_Assigned_Rep__c = assignedRep.Id;

            leadIndex++;
            assignedRep.Last_Lead_Index__c = leadIndex;
        }
        
        update newLeads;
        update salesReps;
    }
}