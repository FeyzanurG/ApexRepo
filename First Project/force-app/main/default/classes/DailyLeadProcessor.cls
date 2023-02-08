public class DailyLeadProcessor implements Schedulable {
    public void execute(SchedulableContext ctx) {
        List<Lead> myLeads = [SELECT Id, LeadSource 
                       		  FROM Lead 
                              WHERE LeadSource = null LIMIT 200];
        List<Lead> listLead = new List<Lead>();
        for(Lead Ld: myLeads){
            Ld.LeadSource = 'Dreamforce';
            listLead.add(Ld);
        }
        update listLead;
    }
}