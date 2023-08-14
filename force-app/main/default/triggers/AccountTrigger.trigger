trigger AccountTrigger on Account (after insert, after update) 
{
    List <Account> accountToValidate = new List<Account>();
    for(Account newAccount : Trigger.new)
    {
        if(!newAccount.Bypass_Address_Validation__c==false)
        {
            System.enqueueJob(new ValidateAddressOnAccount(newAccount.Id));
        }
    }
}