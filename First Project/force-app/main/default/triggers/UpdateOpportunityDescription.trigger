trigger UpdateOpportunityDescription on Opportunity (before insert, before update) {
    
    
    for (Opportunity opp : Trigger.new) {
        
        if (Trigger.isInsert) {
            
            opp.Description = 'This opportunity was created by ' + UserInfo.getName();
            
        } else if (Trigger.isUpdate) {
            
            opp.Description = 'This opportunity was updated by ' + UserInfo.getName();
        }
    }
}