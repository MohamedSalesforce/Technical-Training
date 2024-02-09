@isTest
private class TestEmailToLead {

    @isTest static void testHandleInboundEmail() {
        // Create a new email object
        Messaging.InboundEmail email = new Messaging.InboundEmail();
        email.plainTextBody = 'Test Email Body';
        email.fromName = 'John Doe';
        email.fromAddress = 'john.doe@example.com';
        email.subject = 'Test Subject';

        // Create a new envelope object
        Messaging.InboundEnvelope env = new Messaging.InboundEnvelope();

        // Instantiate the EmailToLead class
        EmailToLead handler = new EmailToLead();

        // Call the handleInboundEmail method
        Test.startTest();
        Messaging.InboundEmailResult result = handler.handleInboundEmail(email, env);
        Test.stopTest();

        // Retrieve the inserted lead
        List<Lead> insertedLeads = [SELECT Id, LastName, Email, Description, Company FROM Lead];

        // Assert that a lead has been inserted
        System.assertEquals(1, insertedLeads.size());
        
        // Assert lead fields
        Lead insertedLead = insertedLeads[0];
        System.assertEquals('John Doe', insertedLead.LastName);
        System.assertEquals('john.doe@example.com', insertedLead.Email);
        System.assertEquals('Test Email Body', insertedLead.Description);
        
        // Check if Company is null, it should be set to 'None'
        if (email.subject != null) {
            System.assertEquals('Test Subject', insertedLead.Company);
        } else {
            System.assertEquals('None', insertedLead.Company);
        }
    }
}