public with sharing class AccountProcessor {
    @future
    public static void countContacts(List<Id> accountIDs) {
        List<Account>  acc =  [SELECT Id, (SELECT Id FROM Contacts) FROM Account WHERE Id in : accountIDs];

        for(Account a: acc){
            a.Number_Of_Contacts__c = a.Contacts.size();
        }

        update acc;
    }
}
