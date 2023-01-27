trigger LeadDuplication on Lead (before insert) {
	List<Lead> leadList = [SELECT Id, FirstName, LastName 
                           FROM Lead 
                           WHERE FirstName =: Trigger.new[0].FirstName 
                           AND LastName =: Trigger.new[0].LastName];
    if(leadList.size()!=0){
        Trigger.new[0].FirstName.addError('There is a duplication on Lead');
    }
}