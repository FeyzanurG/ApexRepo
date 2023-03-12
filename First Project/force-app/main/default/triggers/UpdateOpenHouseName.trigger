trigger UpdateOpenHouseName on Open_House__c (before insert , before update) {
    for(Open_House__c oh : Trigger.new){
        if(Trigger.isbefore && Trigger.isInsert){
            oh.Name=  oh.Country__c + ' - ' + oh.State__c + ' - '  + oh.City__c + ' - ' + oh.Street_and_Number__c +
            ' - ' + ' Open House';
        }
        if(Trigger.isbefore && Trigger.isupdate){
            oh.Name=  oh.Country__c + ' - ' + oh.State__c + ' - ' + oh.City__c + ' - ' + oh.Street_and_Number__c +
            ' - ' + ' Open House';
        }
    }
}