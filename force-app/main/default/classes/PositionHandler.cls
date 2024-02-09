public with sharing class PositionHandler {
    public static void updateField(list<position__c> listOfposition){
        for(position__c pos : listOfposition){
            if(pos.Open_Date__c == null && pos.Min_Pay__c == null && pos.Max_Pay__c == null){
                pos.Open_Date__c = System.today();
                pos.Min_Pay__c = 10000;
                pos.Max_Pay__c = 15000;
            }
        }
    }
}