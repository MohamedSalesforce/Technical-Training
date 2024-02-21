public with sharing class CallingJoke {
    
    @AuraEnabled
    public static String getJoke()
    {
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://official-joke-api.appspot.com/random_joke');
        req.setMethod('GET');
        Http http = new Http();
        HttpResponse res = http.send(req);
        WrapperJoke getJoke = (WrapperJoke) JSON.deserialize(res.getBody(), CallingJoke.WrapperJoke.class);
        return getJoke.setup+getjoke.punchline;        
    }
    public class WrapperJoke 
    {
        public String type{get;set;}
        public String setup{get;set;}
        public String punchline{get;set;}
        public Integer id{get;set;}
    }
}