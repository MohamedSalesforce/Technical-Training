global class EmailToLead implements Messaging.InboundEmailHandler {
    public Messaging.InboundEmailResult handleInboundEmail(Messaging.inboundEmail email, Messaging.InboundEnvelope env) {
        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();

        String myPlainText = email.plainTextBody;
        System.debug(myPlainText);

        if (email.fromName != null && email.fromAddress != null) {
            try {
                Lead createNewLead = new Lead();
                createNewLead.LastName = email.fromName;
                createNewLead.Email = email.fromAddress;            
                createNewLead.Description = email.plainTextBody;
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
            }
        } else {
            System.debug('Email fromName or fromAddress is null. Lead not created.');
        }
        return result;
    }
}