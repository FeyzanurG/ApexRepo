public class AccountHandler {
    public static void onAfterInsert(List<Account> newAcc){
        List<Opportunity> oppList = new List<Opportunity>();
    List<Task> tasks = new List<Task>();
    
    for (Account a : newAcc){
        Opportunity o = new Opportunity();
        o.Name = a.Name + ' Opportunity'; // Salesforce Opportunity
        o.CloseDate = Date.today() + 15;
        o.StageName = 'Prospecting';
        o.AccountId= a.Id;
        oppList.add(o);
        
        if (a.Type == 'Prospect'){
            
         Task t = new Task();
            t.Subject = 'New Account Trigger Test';
            t.Status = 'In Progress';
            t.OwnerId = UserInfo.getUserId();
            t.WhatId = a.Id;
            tasks.add(t);
        } 
    }
        
    insert oppList;
    insert tasks;
        
    Messaging.SingleEmailMessage msg = new Messaging.SingleEmailMessage();
    msg.setSubject('Trigger Email');
    msg.setPlainTextBody('This is a trigger email plain text body');
    List<String> emailList = new List<String>{UserInfo.getUserEmail()};  
    msg.setToAddresses(emailList);
    Messaging.sendEmail(new Messaging.SingleEmailMessage[] {msg });
            
    }
    
    public static void onBeforeDelete(List<Account> oldAcc){
        for(Account a: oldAcc){
            //Check if the account has related contact(s)
          List<Contact> relatedContacts = [SELECT Id FROM Contact WHERE AccountId =: a.Id];
            
            if(!relatedContacts.isEmpty()){
                
                //Throw an error
               a.addError('Can not delete account that is associated with a contact. Please contact with system admin for further help');
            }   
        }
    }
    
    public static void onAfterDelete(List<Account> oldAcc){
        List<DeletedAccount__c> delAccs = new  List<DeletedAccount__c>();
    
   	 for(Account a : oldAcc){
        DeletedAccount__c dAcc = new DeletedAccount__c();
        
        dAcc.Name = a.Name;
        dAcc.Phone__c = a.Phone;
        dAcc.Type__c = a.Type;
        dAcc.DeletedDate__c = System.now();
        delAccs.add(dAcc);
    }
     insert delAccs;
    }
}