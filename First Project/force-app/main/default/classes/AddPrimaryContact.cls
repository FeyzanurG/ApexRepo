public class AddPrimaryContact implements Queueable {
    private Contact Contact;
    private String state;
    public AddPrimaryContact(Contact inputC,String inputstate){
        this.contact=inputC;
        this.state=inputstate;
    }
    public void execute(QueueableContext context) {
        
        // RETRIEVE 200 ACCOUNT RECORDS
    List<Account> accs =[SELECT Id, Name FROM Account WHERE BillingState =: state LIMIT 200];
        
        //CREATE EMTY LIST OF CONTACT RECORDS
    List <Contact>contacts = new List <Contact>();
        
        //ITERATE THROUGH THE ACCOUNT RECORDS
        For(Account a : accs){
            
            //Clone(copy) the contact record, make the clone a child of the specific account 
            //record and add to the list of contacts.
            Contact contactclone = contact.clone();
            contactclone.AccountId = a.Id;
            contacts.add(contactclone);
        }
        insert contacts;
    }
}