@isTest
private class AddPrimaryContactTest {
@isTest
    static void setup() {
        
        //LOAD TEST DATA
        List<Account> accounts = new List<Account>();
        for (Integer i = 0; i < 50; i++) {
            Account a = new Account();
            a.Name = 'Test ' + i;
            a.BillingState = 'NY';
            accounts.add(a);
        }
        for (Integer i = 0; i < 50; i++) {
            Account acc = new Account();
            acc.Name = 'Test ' + i;
            acc.BillingState = 'CA';
            accounts.add(acc);
        }
        insert accounts;
        Contact c = new Contact(FirstName = 'Simon', LastName = 'Brown');
        insert c;
    	
        //PERFORM THE TEST
        Test.startTest();
        System.enqueueJob(new AddPrimaryContact(c, 'CA'));
        Test.stopTest();
        
        //CHECK THE RESULT
        List<Contact> contacts = [SELECT Id, Account.BillingState FROM Contact WHERE Account.BillingState = 'CA'];
        System.assertEquals(50, contacts.size(), 'ERROR');
	}
}