public with sharing class LeadFieldChangeTracker {
    public class LeadFieldChangeTracker implements Queueable {
    SObject oldRecord;
    SObject newRecord;
    
    public LeadFieldChangeTracker(SObject oldRecord, SObject newRecord) {
        this.oldRecord = oldRecord;
        this.newRecord = newRecord;
    }
    
    public void execute(QueueableContext context) {
        FieldChangeTrackerUtil.trackFieldChange(oldRecord, newRecord);
    }
    }
}
