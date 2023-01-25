trigger Account1 on Account (after insert, before delete, after delete) {
    
    //Create an opportunity automatically if user creates an account 
    //When a new account created and the account type is prospect then 
    //create a task for the current user, send email alert to the user
    
        if(Trigger.isAfter && Trigger.isInsert){
        AccountHandler.onAfterInsert(Trigger.new);
        }
    //Throw an error whenever user try to delete the account which is associated to a contact
        if (Trigger.isBefore && Trigger.isDelete){
        AccountHandler.onBeforeDelete(Trigger.old);
        } 
        if (Trigger.isAfter && Trigger.isDelete){
        AccountHandler.onAfterDelete(Trigger.old);
        }
    }