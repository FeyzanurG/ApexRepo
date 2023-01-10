public without sharing class DiscountOppAmount {
    public static void discountUpdate(){
        //get records
    	
        List<Opportunity> opps = [SELECT Id, Amount, Final_Amount__c, Account.Type
                                  FROM Opportunity];
        //calculation
        
        List<Opportunity> newOpps = new List<Opportunity>();
        for(Opportunity opp: opps){
            if(opp.Account.Type == 'Channel Partner / Reseller'){
                //code block
                ////assign value to the field
                opp.Final_Amount__c = opp.Amount - (opp.Amount*0.10);
                //assign to the new list
                newOpps.add(opp);
            }else if(opp.Account.Type == 'Installation Partner'){
                //code block
                //assign value to the field
                opp.Final_Amount__c = opp.Amount - (opp.Amount*0.20);
                //assign to the new list
                newOpps.add(opp);
            }else if(opp.Account.Type == 'Technology Partner'){
                //code block
                //assign value to the field
                opp.Final_Amount__c = opp.Amount - (opp.Amount*0.30);
                //assign to the new list
                newOpps.add(opp);
            }else{ //no condition, rest of the records will be processed here
                //assign value to the field
                opp.Final_Amount__c = opp.Amount - (opp.Amount*0.05);
                //assign to the new list
                newOpps.add(opp);
            }
   	 	}
        
        //DML statement
        update newOpps;
	}
}