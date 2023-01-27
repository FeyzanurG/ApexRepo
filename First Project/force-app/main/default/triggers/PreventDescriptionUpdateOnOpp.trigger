trigger PreventDescriptionUpdateOnOpp on Opportunity (before insert, before update) {
    if(Trigger.isBefore && Trigger.isInsert){
        for(Opportunity opp: Trigger.new){
            opp.description = 'This opportunity was created by ' + UserInfo.getName();
        }
    }
    if(Trigger.isBefore && Trigger.isUpdate){
        for(Opportunity opps: Trigger.new){
            opps.description = 'This opportunity was updated by ' + UserInfo.getName();
        }
    }
}