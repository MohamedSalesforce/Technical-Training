public with sharing class ProcessIntegrationData implements queueable {
    id logId;
    public ProcessIntegrationData(id logId) 
    {
        this.logId = logId;
    }
    public void execute (QueueableContext context){
        System.debug(logId);
        Integration_Log__c logRecord = [SELECT id, Response_Body__c FROM Integration_Log__c WHERE id =: logId];
        Http httpconnection = new Http();
        HttpRequest request = new HttpRequest();
        HttpResponse response = new HttpResponse();
        request.setEndpoint('https://www.toptal.com/developers/postbin/1691559628566-6028449516743');
        request.setMethod('POST');
        request.setBody(logRecord.Request_Body__c);
        response = httpconnection.send(request);
        System.debug(response.getBody());
        System.debug(response.getStatusCode());
        logRecord.Response_Body__c = response.getBody();
        if (response.getStatusCode() == 200){
        logRecord.Is_Successful__c = true;
        }
        update logRecord;

    }
}