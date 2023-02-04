public class OpportunityNametoUppercaseSchedulable implements Schedulable{
    public void execute(SchedulableContext SC){
        List<Opportunity> Opps = [SELECT id, Name FROM Opportunity];
        for (Opportunity op: Opps){
            op.Name=op.Name.toUpperCase();
        }
        Update Opps;
    }
}