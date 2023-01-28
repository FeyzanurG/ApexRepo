///calculate and update the commission async for a large number of sales reps
public class CommissionCalculator {
    @future
    public static void calculateCommission (List<Id>salesRepsId , List<Decimal>salesData){ //user input
        List <Sales_Representative__c> sRList = new List <Sales_Representative__c> ();
        for(Sales_Representative__c  sR: [SELECT Id, Commission_Rate__c , Commission_Amount__c
                                          FROM Sales_Representative__c
                                          WHERE Id IN : salesRepsId] ){
         Decimal commission = sR.Commission_Rate__c * salesData.get(salesRepsId.indexOf(sr.Id));
         sr.Commission_Amount__c  =  commission;
         sRList.add(sR);
                                              
         }
        update sRList; 
    }
}