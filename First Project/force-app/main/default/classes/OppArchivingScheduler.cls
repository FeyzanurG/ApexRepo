//Update opps if close date is in the last year
public class OppArchivingScheduler {
    public void execute(SchedulableContext SC){
        //Query for batch of opps to archive
        List<Opportunity> oldOpps = [SELECT Id, Name,CloseDate 
                                     FROM Opportunity 
                                     WHERE CloseDate < THIS_YEAR];
        List<Opportunity> oppList = new List<Opportunity>();
        //Update old opps
        for(Opportunity opp: oldOpps){
            opp.Name = opp.Name + ' archived';
            opp.Archived__c = true;
            oppList.add(opp);
        }
        update oppList;
    }
}