//Bu test de bi sey var, gecemedim!!!
@isTest
public class AccountDelete_Test {
    @isTest static void singleDeleteTest(){
        //Create Account
        Account acc = new Account(Name = 'Test Account', Type = 'Prospect', Phone = '555-555-55-55');
        insert acc;
        
        //Delete Account
        delete acc;
        
        //Verify the DeletedAccount record creation
        DeletedAccount__c delAcc = [SELECT Id, Name, Phone__c, Type__c, DeletedDate__c 
                                    FROM DeletedAccount__c 
                                    LIMIT 1];
        Account recAcc = [SELECT Name, Type, Phone
                          FROM Account LIMIT 1 ALL ROWS];
        Assert.areEqual(recAcc, delAcc.Name, 'Account name is not as expected');
        Assert.areEqual(recAcc.Phone, delAcc.Phone__c, 'Account phone is not as expected');
        Assert.areEqual(recAcc.Type, delAcc.Type__c, 'Account type is not as expected');
        Assert.isNotNull(delAcc.DeletedDate__c, 'Deleted date field is null');
    }
    
    @isTest static void multipleDeleteTest(){
        TestDataFactory.createAccs(5);
        
        List<Account> accList = [SELECT Id 
                                 FROM Account];
        delete accList;
        
        List<DeletedAccount__c> delAccs = [SELECT Id, Name, Phone__c, Type__c, DeletedDate__c 
                                    FROM DeletedAccount__c];
        List<Account> recAccs = [SELECT Name, Type, Phone
                          		 FROM Account ALL ROWS];
        for(Integer i=0; i<5; i++){
        Assert.areEqual(recAccs[i], delAccs[i].Name, 'Account name is not as expected');
        Assert.areEqual(recAccs[i].Phone, delAccs[i].Phone__c, 'Account phone is not as expected');
        Assert.areEqual(recAccs[i].Type, delAccs[i].Type__c, 'Account type is not as expected');
        Assert.isNotNull(delAccs[i].DeletedDate__c, 'Deleted date field is null');
    }    
  }
}