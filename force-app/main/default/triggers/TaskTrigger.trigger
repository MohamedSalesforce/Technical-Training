trigger TaskTrigger on SOBJECT (before insert) {
    switch on operationType
    {
        when AFTER_INSERT
        {
            
        }
    }
}