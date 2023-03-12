trigger AgentPrevent on Open_House_Show_Agent__c (before insert) {
    if (Trigger.isBefore && Trigger.isInsert){
           for(Open_House_Show_Agent__c a: Trigger.new){
               List<Open_House_Show_Agent__c>workedAgents=[SELECT Agent__c FROM Open_House_Show_Agent__c WHERE Agent__c =:Trigger.new[0].Agent__c];
               if(!workedAgents.isEmpty()){
                   //Throw an error
                   a.addError('This Agent has an appointment Please Select another agent');
               }
           }
    }
   }