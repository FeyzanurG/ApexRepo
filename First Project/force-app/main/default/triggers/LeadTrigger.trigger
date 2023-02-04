trigger LeadTrigger on Lead (before insert, after insert, after update ) {
    if(trigger.isInsert && trigger.isBefore){
        for(lead Ld: Trigger.new){
        List<Lead> leadList = [SELECT Id, LastName, Company 
                           	   FROM Lead 
                           	   WHERE LastName =:Ld.LastName
                               AND Company =: Ld.Company];
        if(leadList.size()>0){
            Ld.LastName.addError('You cannot create duplicate lead');
           }
   	    }
    }
    List<Task> taskList = new List<Task>();
    if(trigger.isInsert && trigger.isBefore){
        for(lead Ld:Trigger.new){
            if(Ld.AnnualRevenue >= 1000000){
                taskList.add(new Task(Subject = 'Follow up VipLead Task', WhoId = Ld.Id));
            }
        }
    }
     if(trigger.isUpdate && trigger.isAfter){
         for(lead Ld: trigger.new){
             if(Ld.AnnualRevenue >= 1000000){
                 taskList.add(new Task(Subject = 'Follow up VipLead update Task', WhoId = Ld.Id));
                }
            }
        }
     
        if(taskList.size()>0){
            insert taskList; 
           } 
   }