public with sharing class DMLLog {
    public static void createLog()
    {
        Contact newContactRecord = new Contact();
        newContactRecord.LastName='Mari';
        Database.SaveResult result =Database.insert(newContactRecord);
        system.debug(result);
        DML_Log__c newDmlLogRecord = new DML_Log__c();
        if(result.isSuccess()==true)
        {
            newDmlLogRecord.SaveResult__c='Record Created Sucessfully,Id is '+result.getId();
        }
        else 
        {
            newDmlLogRecord.SaveResult__c='Record is not created ,error is '+result.getErrors();
        }
        insert newDmlLogRecord;
    }
}