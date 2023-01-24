//Create an opportunity automatically if user creates an account 
//When a new account created and the account type is prospect then create a task for the current user, send email alert to the user
//Throw an error whenever user try to delete the account which is associated to a contact
trigger Account1 on Account (after insert, before delete, after delete) {
    if(Trigger.isAfter && Trigger.isInsert){
    List<Opportunity> oppList = new List<Opportunity>();
    List<Task> tasks = new List<Task>();
    
    for (Account a : Trigger.New){
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

    if (Trigger.isBefore && Trigger.isDelete){
        
        for(Account a: Trigger.old){
            //Check if the account has related contact(s)
          List<Contact> relatedContacts = [SELECT Id FROM Contact WHERE AccountId =: a.Id];
            
            if(!relatedContacts.isEmpty()){
                
                //Throw an error
               a.addError('Can not delete account that is associated with a contact. Please contact with system admin for further help');
            }   
        }   
    } 
    if (Trigger.isAfter && Trigger.isDelete){
        List<DeletedAccount__c> delAccs = new List<DeletedAccount__c>();
    
    for(Account a : Trigger.old){
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