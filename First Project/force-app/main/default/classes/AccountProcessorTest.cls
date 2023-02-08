@isTest
private class AccountProcessorTest {
    @isTest 
    private static void countContacts_Test(){
        List<Account> accounts = new List<Account>();
        for(Integer i=0; i<150; i++){
            accounts.add(new Account(Name = 'Test Account' + i));
        }
        insert accounts;
        
        List<Contact> contacts = new List<Contact>();
        List<Id> accountIds = new List<Id>();
        for(Account acc: accounts){
            contacts.add(new Contact(FirstName =acc.Name, LastName = 'TestContact', AccountId=acc.Id));
            accountIds.add(acc.Id);
        }
        insert contacts;
        
        Test.startTest();
        AccountProcessor.countContacts(accountIds);
        Test.stopTest();
        
        List<Account> accs = [SELECT Id, Number_Of_Contacts__c FROM Account];
        for(Account acc: accs){
            Assert.areEqual(1, acc.Number_Of_Contacts__c, 'Number of Contact field didnot count as expected');
    	}
  	}
}