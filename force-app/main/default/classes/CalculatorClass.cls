public with sharing class CalculatorClass {
    public static Integer performCalculation(Integer number1, Integer number2, String operation) {

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        HttpResponse response =new HttpResponse();
        request.setEndpoint('https://www.google.com/');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'text/xml;charset=UTF-8');
        String requestBody = '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:'+operation+'><tem:intA>'+number1+'</tem:intA><tem:intB>'+number2+'</tem:intB></tem:'+operation+'></soapenv:Body></soapenv:Envelope>';      
        request.setBody(requestBody);
        response = http.send(request);
        String responses = response.getBody();
        Integer result = 0;
        if (result.contains('<' + operation + 'Result>')) {
            result = Integer.valueOf(responses.substringBetween('<' + operation + 'Result>', '</' + operation + 'Result>'));
        }
        return result;
    }
}