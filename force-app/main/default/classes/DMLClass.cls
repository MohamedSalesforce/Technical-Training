public class DMLClass implements LogManager{
    
    public void createLog(String saveResult) {
        Contact dmlLog = new Contact();
        //dmlLog.SaveResult__c = saveResult;
        try {
            insert dmlLog;
        }
        catch(exception e) {
            e.getDmlMessage();
        }
    }
}