public with sharing class UtilityHelper {
    public static Integer generateRandomString() {
        Integer randomNumber = (Integer)(Math.random() * 1000) + 1;
        return randomNumber;
    }
}