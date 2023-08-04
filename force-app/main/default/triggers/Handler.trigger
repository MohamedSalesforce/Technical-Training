trigger Handler on Contact (after insert, after update) {
    if(trigger.isInsert && trigger.isAfter){
        SendWelcomeEmailToLead.emailSendToContact(trigger.new, 'New Contact Created', 'You contact created successfully');
    }
    else if(trigger.isUpdate && trigger.isAfter){
        SendWelcomeEmailToLead.emailSendToContact(trigger.new, 'Contact Updated', 'You contact updated successfully');
    }
}