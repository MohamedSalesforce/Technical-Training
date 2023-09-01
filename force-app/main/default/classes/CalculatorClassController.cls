public with sharing class CalculatorClassController 
{
    @AuraEnabled(cacheable=true)
    public static Integer addTwoNumbers(Integer input1, Integer input2)
    {
       Integer result;
        tempuriOrg.CalculatorSoap soapCall = new tempuriOrg.CalculatorSoap();
        result=soapCall.Add(input1,input2);
        return result;
    }

    @AuraEnabled(cacheable=true)
    public static Integer subTwoNumbers(Integer input1, Integer input2)
    {
        Integer result;
        tempuriOrg.CalculatorSoap soapCall = new tempuriOrg.CalculatorSoap();
        result=soapCall.Subtract(input1,input2);
        return result;
    }

    @AuraEnabled(cacheable=true)
    public static Integer mulTwoNumbers(Integer input1, Integer input2)
    {
        Integer result;
        tempuriOrg.CalculatorSoap soapCall = new tempuriOrg.CalculatorSoap();
        result=soapCall.Multiply(input1,input2);
        return result;
    }
    
    @AuraEnabled(cacheable=true)
    public static Integer divTwoNumbers(Integer input1, Integer input2)
    {
        Integer result;
        tempuriOrg.CalculatorSoap soapCall = new tempuriOrg.CalculatorSoap();
        result=soapCall.Divide(input1,input2);
        return result;
    }
}