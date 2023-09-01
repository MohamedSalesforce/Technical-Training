trigger LeadRoundRobinAssignmentTrigger on Lead (before insert) {
    if (Trigger.isBefore && Trigger.isInsert) {
        LeadAssignmentRoundRobin.assignLeadsToSalesReps(Trigger.new);
    }
}