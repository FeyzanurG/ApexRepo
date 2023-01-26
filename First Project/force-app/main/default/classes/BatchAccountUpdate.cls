global class BatchAccountUpdate implements Database.Batchable<SObject> {
    
    
    global database.querylocator start(Database.BatchableContext BC){
        //this is where you get records for processing, or access to a list of records that is
     	//already been passed and available to the Batch class
        
        String query = 'SELECT Id, Name FROM Account';
        //database ile olan islemlerde query icin string kullanmamaiz lazim
        return Database.getQueryLocator(query); // = [SELECT Id, Name FROM Account]
    }
    
    global void execute(Database.BatchableContext BC, List<Account> scope) {
         //this is where you should be processing the records, making callouts to external systems
        
        List<Account> updAcc = new List<Account>();
        for (Account a: scope ){
            
            if(a.Name == 'Clicked'){
                
                a.Name = a.Name + 'Updated'; // 'Clicked' account name will be updated to 'Clicked Updated'
                updAcc.add(a);
            }
        }
        update updAcc;
        
    } 
    global void finish(Database.BatchableContext BC) {
        //finish method is where you do your DML and commit your processed information to Salesforce, 
    	//this is for creating log records for your integration, and updating processed records to the
    	// database and chaining another batch class or even schedule one.
        
        System.debug('Batch Class Executed Succesfully');
    }
}