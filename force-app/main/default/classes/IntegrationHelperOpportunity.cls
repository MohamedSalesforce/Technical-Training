public with sharing class IntegrationHelperOpportunity
{
    private static final String CLIENT_SECRET ='3485F508E8A7AD29D2FB8FF180E8414E97B8969E4747B9D0EB7094F1AE7DE74F';
    private static final String CLIENT_ID='3MVG9wt4IL4O5wvJDltydlIhWqgdJUtkuArFHY7W6K8Kce8JkYionjg1YKkHB4qwCMclYj020heJn.aRFdsZd';
    private static final String USER_ID='prabhakaran.palani@4iapps.com';
    private static final String PASSWORD='Schneider@123ngN84C6QysDJYhpB43OlpOH4';
    private static final String BASE_END_POINT='https://login.salesforce.com/services/oauth2/token';

    public static WrapperClassForAccessToken getAccessToken()
    {
        Http httpConnection = new Http();
        HttpRequest request = new HttpRequest();
        HttpResponse response = new HttpResponse();
        String ENDPOINT = '?grant_type=password&client_id='+CLIENT_ID+'&client_secret='+CLIENT_SECRET+'&username='+USER_ID+'&password='+PASSWORD;
        request.setEndpoint(BASE_END_POINT+ENDPOINT);
        request.setMethod('POST');
        response = httpConnection.send(request);
        WrapperClassForAccessToken resultParsed = new WrapperClassForAccessToken();
        if (response.getStatusCode() == 200)
        {
            resultParsed = (WrapperClassForAccessToken)JSON.deserialize(response.getBody(), IntegrationHelperOpportunity.WrapperClassForAccessToken.class);
        }
        return resultParsed;
    }

    public static void CreateOpportunity()
    {
        Http HttpConn = new Http();
        HttpRequest request = new HttpRequest();
        HttpResponse response = new HttpResponse();
        String baseEndPoint = getAccessToken().instance_url;
        String endPoint = baseEndPoint + '/services/data/v58.0/sobjects/Opportunity/';
        String bearer = 'Bearer ' + getAccessToken().access_token;
        request.setEndpoint(endPoint);
        request.setMethod('POST');
        request.setHeader('Authorization', bearer);
        request.setHeader('Content-Type', 'application/json');
        OpportunityCreation insertNewRecord = new OpportunityCreation();
        insertNewRecord.Name = 'New Opportunity';
        insertNewRecord.StageName = 'Prospecting';
        insertNewRecord.closeDate = '01/01/2024';
        String jsonBody = JSON.serialize(insertNewRecord);
        request.setBody(jsonBody);
        response = HttpConn.send(request);
        if (response.getStatusCode() == 200 || response.getStatusCode() == 201)
        {
            System.debug(response.getBody());
        }
    }

    public class WrapperClassForAccessToken
    {
        public String access_token { get; set; }
        public String instance_url { get; set; }
        public String id { get; set; }
        public String token_type { get; set; }
        public String issued_at { get; set; }
        public String signature { get; set; }
    }

    public class OpportunityCreation
    {
        public String Name {get; set;}
        public String StageName {get; set;}
        public String CloseDate {get; set;}
    }
}
