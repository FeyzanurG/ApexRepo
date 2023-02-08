@isTest
public class DailyLeadProcessorTest {
@isTest
    static void updateLeads(){
        List<Lead> listLead = new List<Lead>();
        for(Integer i=0; i<200; i++){
            Lead ld = new Lead();
            ld.LastName = 'Brown ' + i;
            ld.Company = 'Salesforce ' + i;
            listLead.add(ld);
        }
        insert listLead;
        
    	Test.startTest();
    	DailyLeadProcessor updateLeadSource = new DailyLeadProcessor();
    	String sch = '20 30 8 10 2 ?';
		String jobID = System.schedule('LeadSource updated', sch, updateLeadSource);
    	Test.stopTest();
        
        List<Lead> leadList = [SELECT Id, LeadSource, LastName, Company FROM Lead WHERE LeadSource = 'Dreamforce'];
        System.assertEquals(200, leadList.size());
        
        List<CronTrigger> cts = [SELECT Id, TimesTriggered, NextFireTime FROM CronTrigger WHERE Id =:jobID];
        System.debug('Next fire time' + cts[0].NextFireTime);
    }
}