public class customSettingClass {
     @AuraEnabled
    public static List<CountryCapital__c> getCustomData(){
       return ( [SELECT Capital__c,Country__c  FROM CountryCapital__c]);
    }
}