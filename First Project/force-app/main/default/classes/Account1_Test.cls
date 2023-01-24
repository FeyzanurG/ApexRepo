@isTest 
public class Account1_Test {

    @isTest static void singleAccountTest(){
        
        //Create account records to fire Account trigger
    	TestDataFactory.createAccs(1); 
        //Expecting to see an Account record (trigger wil be fired and related opp will be created)
        
        //Get the record from database
        Opportunity o = [SELECT Name, AccountId, Account.Id FROM Opportunity LIMIT 1];
        Task t = [SELECT WhatId FROM Task LIMIT 1];
        
        //Testing
        Assert.areEqual(o.AccountId, o.Account.Id, 'Account Trigger did not work as expected');
        Assert.areEqual(t.WhatId, o.Account.Id, 'Task is not related to the account');
        Assert.areEqual(1, Limits.getEmailInvocations(), 'The number of email is not correct');
    }
    @isTest static void multipleAccountTest(){
        //Create 10 accounts records to fire Account trigger
        List<Account> accs = TestDataFactory.createAccs(10);
        
        //Get the records from database
        List<Opportunity> opps = [SELECT Name, AccountId, Account.Id FROM Opportunity];
        List<Task> tasks = [SELECT WhatId FROM Task];
        
        //Testing
        
        for(Integer i=0; i<10; i++){
           Assert.areEqual(opps[i].AccountId, opps[i].Account.Id, 'Account Trigger did not create related op. as expected');
           Assert.areEqual(tasks[i].WhatId, opps[i].Account.Id, 'Account Trigger did not create related task as expected');
           Assert.areEqual(accs.size(), opps.size(), 'Number of account and opps do not match');
           Assert.areEqual(accs.size(), tasks.size(), 'Number of account and tasks do not match');
            //List[index] format ile yaptik yukariyi.
        }
        
       /* for(Opportunity o: opps){
          Assert.areEqual(o.AccountId, o.Account.Id, 'Account Trigger did not work as expected');
        //this was for only opportunity list testing
        }*/
    }
}