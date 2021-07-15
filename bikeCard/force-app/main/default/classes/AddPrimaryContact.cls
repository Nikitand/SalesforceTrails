public  class AddPrimaryContact implements Queueable {
    private Contact contact;
    private String state;
   public AddPrimaryContact(Contact inputContact, string inputSize){
       this.contact = inputContact;
       this.state = inputSize;
   }

   public void execute(QueueableContext context) {
    List<Account> accounts = [select id from account where BillingState = :state LIMIT 200];
    List<Contact> contacts = new List<Contact>();
    for (Account account : accounts) {

        Contact contactClone = contact.clone();
        contactClone.AccountId =account.Id;
        contacts.add(contactClone);
    }
    insert contacts;
    }
}
