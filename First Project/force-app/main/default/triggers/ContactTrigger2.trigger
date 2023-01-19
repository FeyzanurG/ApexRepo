trigger ContactTrigger2 on Contact (before update) {
    for(Contact c: Trigger.New){
        c.Description = 'Change made by ' + UserInfo.getName();
    }
}