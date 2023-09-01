public class FieldChangeTracker implements Queueable {
    public Id recordId;
    public String objectApiName;
    public String fieldApiName;
    
    public FieldChangeTracker(Id recordId, String objectApiName, String fieldApiName) {
        this.recordId = recordId;
        this.objectApiName = objectApiName;
        this.fieldApiName = fieldApiName;
    }
    
    public void execute(QueueableContext context) {
        SObject oldRecord = [SELECT Id, Name FROM :objectApiName WHERE Id = :recordId];
        SObject newRecord = [SELECT Id, Name FROM :objectApiName WHERE Id = :recordId];
        
        String previousValue = (String) oldRecord.get(fieldApiName);
        String updatedValue = (String) newRecord.get(fieldApiName);
        
        if (previousValue != updatedValue) {
            String changedBy = UserInfo.getName();
            Datetime changeTimestamp = Datetime.now();
            
            SObject changeRecord = new SObject(LeadChange__c.SObjectType);
            changeRecord.put('LeadId__c', recordId);
            changeRecord.put('Previous_Name__c', previousValue);
            changeRecord.put('Updated_Name__c', updatedValue);
            changeRecord.put('Changed_By__c', changedBy);
            changeRecord.put('Change_Timestamp__c', changeTimestamp);
            
            insert changeRecord;
        }
    }
}