public with sharing class SingleEmailService {
    public static void emailService(){
        Messaging.SingleEmailMessage msg = new Messaging.SingleEmailMessage();
        // msg.setToAddresses(new String[]{'vigneshdv21@gmail.com'});
        // List<Id> contactIds = new List<Id>();
        List<Contact> emailsToBeSent = [SELECT Id,Name,Email FROM Contact WHERE CreatedDate = Today];
        EmailTemplate emailTemplateId = [SELECT Id, Name FROM EmailTemplate WHERE Name = 'Commerce Reorder Portal: Invitation'];
        for(Contact idsToBeMailed :emailsToBeSent )
        {
            //contactIds.add(idsToBeMailed.Id);
            msg.setTargetObjectId(idsToBeMailed.Id);
        }
        //msg.setTargetObjectId(contactIds);
        msg.setTemplateId(emailTemplateId.Id);
        // msg.setSubject('Email Service');
        // msg.setPlainTextBody('This is dummy email body');
        // msg.setCcAddresses(new String[]{'0055i000009NTQT'});
        messaging.sendEmail(new List<Messaging.SingleEmailMessage> {msg});
    }
}