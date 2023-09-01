trigger sendEmailToContact on Contact (after insert) {
    List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();
    
    for (Contact newContact : Trigger.new) {
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        email.setTemplateId('your_email_template_id'); // Replace with your email template's ID
        email.setTargetObjectId(newContact.Id);
        email.setSaveAsActivity(false);
        emailList.add(email);
    }
    Messaging.sendEmail(emailList);
}
