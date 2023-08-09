public with sharing class SendWelcomeEmailToLead {
    public static void emailSendToContact(List<contact> triggernew, string sSubject, string sBody){
    // Step 1: Create a master list to hold the emails we'll send
  List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
  
  for (Contact myContact : triggernew) {
    if (myContact.Email != null) {
      Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
    
      // Step 2: Set list of people who should get the email
      List<String> sendTo = new List<String>();
      sendTo.add(myContact.Email);
      mail.setToAddresses(sendTo);
    
      // Step 3: Set who the email is sent from
      mail.setReplyTo('samsudeenmohamed29@gmail.com');  //update it with your desired email 
      mail.setSenderDisplayName('Mohamed Samsudeen'); //update it with your desired Name 
     

      // Step 4. Set email contents - you can use variables!
      mail.setSubject(sSubject);
      String body = 'Dear ' + myContact.LastName + ', ';
      body += sBody;
    
      mail.setHtmlBody(body);
    
      // Step 5. Add your email to the master list
      mails.add(mail);
    }
  }
  // Step 6: Send all emails in the master list
  Messaging.sendEmail(mails);
    }
}