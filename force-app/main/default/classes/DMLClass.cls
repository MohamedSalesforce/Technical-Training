public class DMLClass implements LogManager{
    public void performDML() {
        // Perform DML operations here
        // ...
        
        // After DML operation, call the createLog method
        createLog('DML operation executed successfully');
    }
    
    public void createLog(String saveResult) {
        DML_Log__c dmlLog = new DML_Log__c();
        dmlLog.SaveResult__c = saveResult;
        insert dmlLog;
    }
}