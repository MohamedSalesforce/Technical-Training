trigger LeadTrigger on Lead (after insert, after update) 
{
    // if((Trigger.isInsert || Trigger.isUpdate) && Trigger.isAfter){     
    //     LeadConversionAutomation.createAccConOpp(Trigger.new);
    // }
}