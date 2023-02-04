global class AccountNameUpperCaseBatchable implements Database.Batchable<sObject>{
    global Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator([SELECT id, Name FROM Account]);
        }
    global void execute(Database.BatchableContext BC, List<Account> accs){
        for(Account ac:accs){
            ac.Name=ac.Name.toUpperCase();
        }
        Update accs;
        
    }
    global void finish(Database.BatchableContext BC){
        
    }
}