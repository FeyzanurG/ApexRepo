public class LeadProcessor implements Database.Batchable<sObject> {
    public Integer recordsProcessed = 0;
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator([SELECT Id, Name FROM Lead]);
    }
    public void execute(Database.BatchableContext bc, List<Lead> scope){
        for(Lead l: scope){
            l.LeadSource = 'Dreamforce';
            recordsProcessed = recordsProcessed + 1;
        }
        update scope;
    }
    public void finish(Database.BatchableContext bc){
        System.debug('Batch Class Executed Succesfully');
    }
}