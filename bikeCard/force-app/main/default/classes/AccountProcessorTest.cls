@isTest
private  class AccountProcessorTest {

    @isTest
    private static void countContactTest(){
        List<Account> accounts = new List<Account>();
        for (Integer i=0; i<300; i++){
            accounts.add(new Account(Name='Test Account ' + i));
        }
        insert accounts;
        List<Contact> contacts =  new List<Contact>();
        List<Id> accountsid =  new List<Id>();
        for(Account a: accounts){
            contacts.add(new Contact(FirstName=a.Name, LastName='TestLastName', AccountId = a.Id));
        accountsid.add(a.Id);
        }
        insert contacts;

         Test.startTest();
         AccountProcessor.countContacts(accountsid);
         Test.stopTest();

         List<Account> acc = [SELECT Id, Number_of_Contacts__c  FROM Account];
         for(Account ac:acc){
             System.assertEquals(1, ac.Number_of_Contacts__c,'Errror');
         }
    }

}
