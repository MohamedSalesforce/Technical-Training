public with sharing class LeadConversionAutomation {
    public LeadConversionAutomation() {
    }
    // public static void createAccConOpp(List<Lead> newLead) {
    //     List<Account> accList = new List<Account>();
    //     List<Contact> conList = new List<Contact>();
    //     List<Opportunity> oppList = new List<Opportunity>();

    //     for (Lead oneLead : newLead) {
    //         if (oneLead.Status == 'Closed - Converted') {

    //             Account acc = new Account();
    //             acc.Name = oneLead.Company;
    //             acc.Industry = oneLead.Industry;
    //             accList.add(acc);
                
    //             Contact con = new Contact();
    //             con.LastName = oneLead.LastName;
    //             con.AccountId = acc.Id;
    //             conList.add(con);
                
    //             Opportunity opp = new Opportunity();
    //             opp.Name = oneLead.Company + ' ' + 'Opp 1';
    //             opp.StageName = 'Prospecting';
    //             opp.CloseDate = System.today();
    //             opp.AccountId = acc.Id;
    //             oppList.add(opp);
    //         }
    //     }
    //     insert accList;
    //     insert conList;
    //     insert oppList;
    // }
}