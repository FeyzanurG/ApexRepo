//search Oil companies and apply predifened discount(40%).
//Also set Account description field of oppd as 'Eligible for premium discount'
public without sharing class DiscountOilCompanies {
    //List of lists - search result for accounts and opportunities
    public static void searchUpdate(){
        List<List<sObject>> searchResult = [FIND 'Oil' IN ALL FIELDS 
                                            RETURNING Account(Id, Description), Opportunity(Id, Amount, Final_Amount__c)];
        
        //Separated Account and Opportunity Lists
        List<Account> accs = (List<Account>) searchResult[0];
        System.debug(accs);
        List<Opportunity> opps = (List<Opportunity>) searchResult[1];
        System.debug(opps);
        
        //New empty Lists for Account and Opportunities
        List<Account> newAccs = new List<Account>();
        List<Opportunity> newOpps = new List<Opportunity>();
        
        for(Account a: accs){
            a.Description = 'Eligible for premium discount';
            newAccs.add(a);
        }
        for(Opportunity o: opps){
            o.Final_Amount__c = o.Amount-(o.Amount*0.40);
            newOpps.add(o);
        }
        //DML Statement
        update newAccs;
        Update newOpps;
    }
}