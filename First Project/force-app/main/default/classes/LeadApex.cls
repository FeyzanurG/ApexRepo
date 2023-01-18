public class LeadApex {
	//Properties

    //Methods
    public static void getLead(String eyalet,String sirket){
        List<Lead> multiLead = [SELECT Id, LastName, FirstName, State, Company 
                                FROM Lead 
                                WHERE State =: eyalet AND Company =: sirket];
		for(Lead singleLead:multiLead){
    		System.debug(singleLead.FirstName);
    		System.debug(singleLead.LastName);
            System.debug(singleLead.State);
            System.debug(singleLead.Company);
    		System.debug('*************');
		}
    }
}