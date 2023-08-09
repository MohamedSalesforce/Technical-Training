public with sharing class DMLLog {
    public static void createLog(){
        // creating an new contact in contact object
        Contact newContactRecord = new Contact();
        newContactRecord.LastName='Mari';
        Database.SaveResult result =Database.insert(newContactRecord);
        system.debug(result);
        //creating new object for DML Log object
        DML_Log__c newDmlLogRecord = new DML_Log__c();
        //If the contact is created succesfully then the if part is executed and store those success message in 'SaveResult' custom field
        if(result.isSuccess()==true){ep
            newDmlLogRecord.SaveResult__c='Record Created Sucessfully,Id is '+result.getId();
        }
        //If the contact is unsuccessful then the else part will execute and store those error message in 'SaveResult' custom field  
        else {
            newDmlLogRecord.SaveResult__c='Record is not created ,error is '+result.getErrors();
        }
        insert newDmlLogRecord;
    }
}