public with sharing class ValidateAddressOnAccount implements Queueable, Database.AllowsCallouts {
    Id accountId;
    public ValidateAddressOnAccount(id accountId) 
    {
        this.accountId=accountId;
    }
    public void execute(QueueableContext context)
    {
        Account currentAccount = [SELECT BillingStreet, BillingCity, BillingState, BillingCountry, BillingPostalCode 
                                FROM Account
                                WHERE Id=:accountId];

        Http httpconnection = new Http();
        HttpRequest request = new HttpRequest();
        HttpResponse response = new HttpResponse();
        request.setEndpoint('https://www.toptal.com/developers/postbin/1691559628566-6028449516743');
        request.setMethod('POST');
        //request.setBody(logRecord.Request_Body__c);
        response = httpconnection.send(request);
        if (response.getStatus()==200)
        {
            String body = response.getBody();
            Map<String,Account> results = (Map<String,Account>) Json.deserializeUntyped(body);
            currentAccount.BillingStreeet = (string)results.get('formatted_Address');
            currentAccount.Bypass_Address_Validation__c = true;
            //currentAccount.BillingStreet=JSON.deserialize(body);
        }
        update currentAccount;
    }
}