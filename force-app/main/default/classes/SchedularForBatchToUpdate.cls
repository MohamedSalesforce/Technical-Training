public with sharing class SchedularForBatchToUpdate implements Schedulable
{
    public SchedularForBatchToUpdate() 
    {

    }
    public void execute(SchedulableContext context)
    {
        Database.executeBatch(new AccountAndContactUpdate(),2);
    }
}