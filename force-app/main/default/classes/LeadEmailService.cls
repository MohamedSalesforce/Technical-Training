public with sharing class LeadEmailService implements Messaging.InboundEmailHandler 
{
//     global Messaging.InboundEmailResult handleInboundEmail (Messaging.InboundEmail email, Messaging.InboundEnvelope envelope)
//     {
//         Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();
//         string str = email.fromname;
//         //list<string> strList=str.split(‘ ‘, 2);
//         Lead led = new Lead();
//         led.FirstName = strList[0];
//         led.LastName = strList[1];
//         led.Company = '';
//         led.Email = envelope.fromAddress;
//         led.LeadSource = '';
//         insert led;
//         return result;
// }
public Messaging.InboundEmailResult handleInboundEmail(Messaging.inboundEmail email, 
                                                       Messaging.InboundEnvelope env){
    // Create an InboundEmailResult object for returning the result of the 
    // Apex Email Service
    Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
    String myPlainText= '';
    // Add the email plain text into the local variable 
    myPlainText = email.plainTextBody;
    system.debug(myPlainText);
    // New Task object to be created
    Lead[] newLead = new Lead[0];
    // Try to look up any contacts based on the email from address
    // If there is more than one contact with the same email address,
    // an exception will be thrown and the catch statement will be called.
    // try {
    //   Contact vCon = [SELECT Id, Name, Email
    //     FROM Contact
    //     WHERE Email = :email.fromAddress
    //     WITH USER_MODE
    //     LIMIT 1];
      // Add a new Task to the contact record we just found above.
      newLead.add(new Lead(Description =  myPlainText,
        //    Priority = 'Normal',
        //    Status = '',
        //    Subject = email.subject,
           LastName = email.fromName,
           Email = email.fromAddress));
        //    WhoId =  vCon.Id
        
     // Insert the new Task 
    // insert as user newTask;    
    insert newLead;
     System.debug('New Task Object: ' + newLead );   
    // If an exception occurs when the query accesses 
    // the contact record, a QueryException is called.
    // The exception is written to the Apex debug log.
//    catch (QueryException e) {
//        System.debug('Query Issue: ' + e);
//    }
   // Set the result to true. No need to send an email back to the user 
   // with an error message
   result.success = true;
   // Return the result for the Apex Email Service
   return result;
  }
}