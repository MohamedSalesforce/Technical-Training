    public with sharing class AccountTriggerHandler {
        public AccountTriggerHandler() {

        }
        // public static void accountRating(List<Account> newList){
        //     for (Account inAcc : newList){
        //         if(inAcc.Industry != null && inAcc.Industry == 'Media'){
        //             inAcc.Rating = 'Hot';
        //         }
        //     }
        // }
        // public static void createRealtedOpp(List<Account> newList){

        //     List<Opportunity> relatedOpp = new List<Opportunity>();

        //     for (Account upAcc :newList){
        //         Opportunity opp = new Opportunity();
        //         opp.Name = upAcc.Name;
        //         opp.AccountId = upAcc.Id;
        //         opp.CloseDate = System.today();
        //         opp.StageName = 'Prospecting';

        //         relatedOpp.add(opp);
        //     }
        //     if(!relatedOpp.isEmpty()){
        //         insert relatedOpp;
        //     }

        //     List<Contact> relatedCon = new List<Contact>();

        //     for(Account acc : newList){
        //         Contact con = new COntact();
        //         con.AccountId = acc.Id;
        //         con.LastName = acc.Name;
        //         relatedCon.add(con);
        //     }
        //     if(!relatedCon.isEmpty()){
        //         insert relatedCon;
        //     }
        // }
    }