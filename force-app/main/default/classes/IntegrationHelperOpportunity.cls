public with sharing class IntegrationHelperOpportunity
{
    // These are constants for the OAuth 2.0 authentication process
    private static final String CLIENT_SECRET ='3485F508E8A7AD29D2FB8FF180E8414E97B8969E4747B9D0EB7094F1AE7DE74F';
    private static final String CLIENT_ID='3MVG9wt4IL4O5wvJDltydlIhWqgdJUtkuArFHY7W6K8Kce8JkYionjg1YKkHB4qwCMclYj020heJn.aRFdsZd';
    private static final String USER_ID='prabhakaran.palani@4iapps.com';
    private static final String PASSWORD='Schneider@123ngN84C6QysDJYhpB43OlpOH4';
    private static final String BASE_END_POINT='https://login.salesforce.com/services/oauth2/token';

    // This method obtains an access token for authentication
    public static WrapperClassForAccessToken getAccessToken()
    {
        Http httpConnection = new Http();
        HttpRequest request = new HttpRequest();
        HttpResponse response = new HttpResponse();
        // Construct the endpoint for obtaining an access tokenp
        String ENDPOINT = '?grant_type=password&client_id='+CLIENT_ID+'&client_secret='+CLIENT_SECRET+'&username='+USER_ID+'&password='+PASSWORD;
        request.setEndpoint(BASE_END_POINT+ENDPOINT);
        request.setMethod('POST');
        // Send the request and receive the response
        response = httpConnection.send(request);
        // Deserialize the response into a WrapperClassForAccessToken object
        WrapperClassForAccessToken resultParsed = new WrapperClassForAccessToken();
        if (response.getStatusCode() == 200)
        {
            resultParsed = (WrapperClassForAccessToken)JSON.deserialize(response.getBody(), IntegrationHelperOpportunity.WrapperClassForAccessToken.class);
        }
        return resultParsed;
    }

    // This method creates an Opportunity using the REST API
    public static void CreateOpportunity()
    {
        Http HttpConn = new Http();
        HttpRequest request = new HttpRequest();
        HttpResponse response = new HttpResponse();
        // Obtain the base endpoint from the access token
        String baseEndPoint = getAccessToken().instance_url;
        // Construct the endpoint for creating an Opportunity
        String endPoint = baseEndPoint + '/services/data/v58.0/sobjects/Opportunity/';
        // Include the access token in the request headers
        String bearer = 'Bearer ' + getAccessToken().access_token;
        request.setEndpoint(endPoint);
        request.setMethod('POST');
        request.setHeader('Authorization', bearer);
        request.setHeader('Content-Type', 'application/json');
        // Prepare the Opportunity data
        OpportunityCreation insertNewRecord = new OpportunityCreation();
        // Add more Opportunity fields as needed
        insertNewRecord.Name = 'New Opportunity';
        insertNewRecord.StageName = 'Prospecting';
        insertNewRecord.closeDate = '01/01/2024';
        // Serialize the Opportunity data into JSON format and set it as the request body
        String jsonBody = JSON.serialize(insertNewRecord);
        request.setBody(jsonBody);
        // Send the request to create the Opportunity
        response = HttpConn.send(request);
        if (response.getStatusCode() == 200 || response.getStatusCode() == 201)
        {
            System.debug(response.getBody());
        }
    }
    // Wrapper class to hold the access token information
    public class WrapperClassForAccessToken
    {
        public String access_token { get; set; }
        public String instance_url { get; set; }
        public String id { get; set; }
        public String token_type { get; set; }
        public String issued_at { get; set; }
        public String signature { get; set; }
    }
    // Wrapper class to hold Opportunity data for creation
    public class OpportunityCreation
    {
        // Add more Opportunity fields as needed
        public String Name {get; set;}
        public String StageName {get; set;}
        public String CloseDate {get; set;}
    }
}