public with sharing class AccountHandler {
    public static void ratingUpdate(List<Account> listOfAccount){
        for(Account acc : listOfAccount){
            if(acc.Industry == null || acc.Industry == 'Media'){
                acc.Rating = 'Hot';
            }
        }
    }
    public static void updateBillingToShipping(List<Account> listOfAccount){
        for(Account acc : listOfAccount){
            if(acc.BillingStreet != null && acc.BillingCity != null && acc.BillingCountry != null && acc.BillingState != null && acc.BillingPostalCode != null && acc.CopyBillingToShipping__c == True){
                acc.ShippingStreet = acc.BillingStreet;
                acc.ShippingCity = acc.BillingCity;
                acc.ShippingCountry = acc.BillingCountry;
                acc.ShippingState  = acc.BillingState;
                acc.ShippingPostalCode = acc.BillingPostalCode;
            }
        }
    }
    public static void createRelatedContactForAccount(List<Account> listOfAccount){
        List<Contact> contactToBeInserted = new List<Contact>();
        for(Account acc : listOfAccount){
            Contact con = new Contact();
            con.LastName = acc.Name;
            con.AccountId = acc.Id;
            contactToBeInserted.add(con);
        }
        insert contactToBeInserted;
    }
    public static void createRelatedOpportunityForAccount(List<Account> listOfAccount){
        List<Opportunity> opportunityToBeInserted = new List<Opportunity>();
        for (Account acc : listOfAccount){
            Opportunity opp = new Opportunity();
            opp.Name = acc.Name;
            opp.AccountId = acc.Id;
            opp.StageName = 'Prospecting';
            opp.CloseDate = System.today()+30;
            opportunityToBeInserted.add(opp);
        }
        insert opportunityToBeInserted;
    }
}