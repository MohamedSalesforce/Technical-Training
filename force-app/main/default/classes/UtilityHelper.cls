public with sharing class UtilityHelpe {
    public static Integer generateRandomString(){
        Integer randomNum = (Integer)Math.ceil(Math.random() * 1000);
        System.debug('Random Number: ' + randomNum);
        return randomNum;
    }
}