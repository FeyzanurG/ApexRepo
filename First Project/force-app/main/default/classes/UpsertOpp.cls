public class UpsertOpp {
    public static void upsertOpportunity(){
        Opportunity opp = [SELECT Id, Name, CloseDate, Description FROM Opportunity WHERE Name = 'Cohort 5' LIMIT 1];
        opp.CloseDate = date.today();
        opp.Description = 'This is an hands-on recap lesson';
        upsert opp;
    }
}