trigger UpdateAsset on Inspection__c (before insert, after update) {
	
    if(Trigger.isBefore && Trigger.isInsert){
        List<Asset> assets = new List<Asset>();
        for(Inspection__c i : Trigger.new){
            Asset a = [SELECT Id, Inspection_Required__c
                       FROM Asset
                       WHERE Id =: i.Asset__c];
            a.Inspection_Required__c = true;
            assets.add(a);
        }
        update assets;
    }
    
    if(Trigger.isAfter && Trigger.isUpdate){
        List<Asset> assets = new List<Asset>();
        for(Inspection__c i : Trigger.new){
            if(i.Status__c == 'Completed'){
                Asset a = [SELECT Id, Inspection_Required__c
                           FROM Asset
                           WHERE Id =: i.Asset__c];
                a.Inspection_Required__c = false;
                assets.add(a);
            }
        }
        update assets;
    }
}