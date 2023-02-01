//Update all contracts async term(months) if it is shorter than new Contract term months provided by the user, Send email to the accountant of the company
global class UpdateContractTermBatch implements Database.Batchable<SObject> {
    
    private Integer newContractTerm;
    
    public UpdateContractTermBatch(Integer newNumberOfMonths){
        
        this.newContractTerm = newNumberOfMonths;
        
    }
    global database.querylocator start(Database.BatchableContext BC){
      //Query for the contracts that need to be updated
      
       
        return database.getQueryLocator([SELECT Id, ContractTerm FROM Contract WHERE ContractTerm <: newContractTerm ]);
    }
    
    global void execute(Database.BatchableContext BC, List<Contract> scope)  {
        // List<Contract> newListC = new List<Contract>();
       // Update the contract terms (months)
        for (Contract c : scope){
            
            c.ContractTerm = newContractTerm;
            //newListC.add(c);
        }
        //update newListC;
        update scope;
        
    } 
    global void finish(Database.BatchableContext BC) {
        //Send Email Notification
       Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        
       
        email.setToAddresses( new String[] {'accountant@example.com'} );
        email.setSubject('Batch Update for Contract Terms completed');
        email.setPlainTextBody(' The batch update of Contract term(months) has been completed succesfully!');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{email});
        
    }
}