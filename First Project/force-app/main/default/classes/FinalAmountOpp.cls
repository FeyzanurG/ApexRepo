public with sharing class FinalAmountOpp {
    public static void discountCalculator(Id oppId, Decimal rate){
        //get records
        Opportunity opp = [SELECT Id, Amount FROM Opportunity WHERE Id =: oppId LIMIT 1];
        //Calculation
        opp.Final_Amount__c = opp.Amount - (opp.Amount*rate);
        //manipulate the record by DML
        update opp;
    }
}