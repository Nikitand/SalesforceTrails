@isTest
public class AddPrimaryContactTest {
    @isTest
    static void testQueueableClass() {
        List<Account> accounts = new List<Account>();
        // add a parent account
        for (Integer i = 0; i < 500; i++) {
            Account acc =  new Account(Name='Test Account');
            if(i<250){
                acc.BillingState='NY';
            }
            else{
                acc.BillingState='CA';
            }
            accounts.add(acc);
        }
        insert accounts;

        Contact contact = new Contact(FirstName='Nikita', LastName='Osoprilko');
        insert contact;
    
        Test.startTest();
        Id jobsId =System.enqueueJob(new AddPrimaryContact(contact, 'CA'));
        Test.stopTest();

        // Validate the job ran. Check if record have correct parentId now
        List<Contact> contacts =  [SELECT Id FROM Contact WHERE Contact.Account.BillingState = 'CA'];
        System.assertEquals(200, contacts.size(), 'Errror');
    }
}