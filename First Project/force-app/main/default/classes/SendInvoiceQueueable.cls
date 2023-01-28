//Create invoices async for the customers if there is any opportunity closedWon in last 100 days
public class SendInvoiceQueueable implements Queueable {
    public void execute(QueueableContext context){
        //get all closedWon opps with a closed date within the last 30 days
        List<Opportunity> oppList = [SELECT Id, CloseDate, AccountId, StageName 
                                  FROM Opportunity 
                                  WHERE IsWon = true 
                                  AND CloseDate = LAST_N_DAYS:100];
        List<My_Invoice__c> invoices = new List<My_Invoice__c>();
        for(Opportunity opp: oppList){
            My_Invoice__c invoice = new My_Invoice__c();
            invoice.CustomerId__c = opp.AccountId;
            invoice.OpportunityId__c = opp.Id;
            invoices.add(invoice);
        }
        insert invoices;
        //Send invoices to customers
        //Code to send invoice via email or other method with or wothout callout
    }
}