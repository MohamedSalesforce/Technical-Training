global class EmailToLead implements Messaging.InboundEmailHandler {
    public Messaging.InboundEmailResult handleInboundEmail(Messaging.inboundEmail email, Messaging.InboundEnvelope env) {
        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();

        String myPlainText = email.plainTextBody;
        System.debug(myPlainText);

        if (email.fromName != null && email.fromAddress != null) {
            try {
                Email_Data__c createNewLead = new Email_Data__c();
                createNewLead.From_Name__c = email.fromName;
                createNewLead.From_Address__c = email.fromAddress;            
                createNewLead.Email_Body__c = email.plainTextBody;
                createNewLead.CC_Address__c = email.ccAddresses;
                createNewLead.Attachements__c = email.textAttachments;
                createNewLead.To_Address__c = email.toAddresses;
                createNewLead.Subject__c = email.subject;
                createNewLead.CurrencyIsoCode = 'AED';
                    if(createNewLead.Company != null){
                        createNewLead.Company = 'None';
                    }
                	else{
                    	createNewLead.Company = email.subject;
                	}
				System.debug(createNewLead);
                insert createNewLead;
                
                System.debug('Lead inserted successfully');
            } catch (Exception e) {
            System.debug('Error inserting lead: ' + e.getMessage());

		    Error_Log__c newError = new Error_Log__c();
		    newError.Error_Message__c = e.getMessage();
		    newError.Email_Cause__c_c = e.getCause();
		    newError.Dml_Status_Code__c = e.getDmlStatusCode();
            newError.Dml_Type__c = e.getDmlType();
            newError.Dml_Message__c = e.getDmlMessage();
            newError.Line_Number__c = e.getLineNumber();
            }
        }
        return result;
    }
}