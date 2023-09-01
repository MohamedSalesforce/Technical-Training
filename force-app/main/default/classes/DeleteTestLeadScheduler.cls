public with sharing class DeleteTestLeadScheduler implements Schedulable {
    
    public DeleteTestLeadScheduler() {
        // Constructor - No initialization needed
    }
    
    // Method to execute the scheduled job
    public void execute(SchedulableContext context) {
        // Query leads with name containing 'Test' and limit to 100 records
        List<Lead> leadsToDelete = [SELECT Id, Name FROM Lead WHERE Name LIKE '%Test%' LIMIT 100];
        
        if (!leadsToDelete.isEmpty()) {
            // Delete the queried leads
            delete leadsToDelete;

            // Query system administrators' emails
            List<User> admins = [SELECT Id, Email FROM User WHERE Profile.Name = 'System Administrator'];
            
            // Create email body
            String emailBody = 'Spam Lead deletion operation completed. ' + leadsToDelete.size();
            
            // Create email messages
            List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
            for (User admin : admins) {
                Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
                email.setToAddresses(new String[] { admin.Email });
                email.setSubject('Lead Deletion Operation');
                email.setPlainTextBody(emailBody);
                emails.add(email);
            }
            
            // Send email messages
            Messaging.sendEmail(emails);
        }
    }
    
    // Method to schedule the lead deletion job
    public static void scheduleLeadDeletionJob() {
        DeleteTestLeadScheduler scheduler = new DeleteTestLeadScheduler();
        String cronExp = '0 30 9 * * ?'; // Schedule at 9:30 AM daily
        System.schedule('LeadDeletionJob', cronExp, scheduler);
    }
    
    // Schedule the lead deletion job when the class is executed
    static {
        scheduleLeadDeletionJob();
    }
}