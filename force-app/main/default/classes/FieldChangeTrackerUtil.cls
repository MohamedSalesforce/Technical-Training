public with sharing class FieldChangeTrackerUtil {
    public static void trackFieldChange(SObject oldRecord, SObject newRecord) {
        FieldChangeTrackerSettings__c settings = FieldChangeTrackerSettings__c.getInstance();
        String objectApiName = settings.LeadObjectApiName__c;
        String nameFieldApiName = settings.NameFieldApiName__c;
        
        String previousValue = (String) oldRecord.get(nameFieldApiName);
        String updatedValue = (String) newRecord.get(nameFieldApiName);
        
        if (previousValue != updatedValue) {
            String changedBy = UserInfo.getName();
            Datetime changeTimestamp = Datetime.now();
            
            SObject changeRecord = new SObject(LeadChange__c.SObjectType);
            changeRecord.put('Previous_Name__c', previousValue);
            changeRecord.put('Updated_Name__c', updatedValue);
            changeRecord.put('Changed_By__c', changedBy);
            changeRecord.put('Change_Timestamp__c', changeTimestamp);
            
            insert changeRecord;
        }
    }
}
