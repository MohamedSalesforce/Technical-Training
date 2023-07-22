public with sharing class RandomString {
public static Integer generateRandomString()
    {
        Integer num=Integer.valueOf(Math.random()*1000);
        system.debug(num);
        return num;
    }
    public static Boolean validateLoggedInUserHasCreateAccessToObject(String objectName)
    {
        // Get the SObject in which you want check the user has create access
        Schema.SObjectType objectType = Schema.getGlobalDescribe().get(objectName);
        // Check if the object is accessible and createable by the current user
        Boolean hasAccess = objectType.getDescribe().isAccessible() && objectType.getDescribe().isCreateable();
        return hasAccess;
    }
}