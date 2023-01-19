trigger ContactTrigger on Contact (before insert, before update) {
    //we merged conTri1 ile conTri2 yu.(class lar merge edilebiliyor boyle, triggerlar)
    for(Contact c: Trigger.New){
        if(Trigger.isBefore && Trigger.isInsert){
            ContactHandler.beforeInsert(Trigger.new);
        }
        if(Trigger.isBefore && Trigger.isInsert){
            c.Description = 'Change made by ' + UserInfo.getName();
        }
    }
}
