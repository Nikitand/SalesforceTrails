public with sharing class PropertyController {
    @AuraEnabled(cacheable=true)
    public static List<Property__c> getPropertyList() {
        return [SELECT Id, Name__c, Price__c FROM Property__c ];
    }
}

