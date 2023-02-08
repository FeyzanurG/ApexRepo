@isTest
public class LeadProcessorTest {
@isTest
    static void setup(){
        List<Lead> leads = new List<Lead>();
        for(Integer i=0;i<200;i++){
            Lead ld = new Lead();
            ld.LastName = 'Test ' + i;
            ld.Company = 'Test Company ' + i;
            leads.add(ld);
        }
        insert leads;

        Test.startTest();
        LeadProcessor uca = new LeadProcessor();
        Id batchId = Database.executeBatch(uca, 200);
        Test.stopTest();
        // after the testing stops, assert records were updated properly
        System.assertEquals(200, [SELECT count() FROM Lead WHERE LeadSource = 'Dreamforce']);
    }  
}