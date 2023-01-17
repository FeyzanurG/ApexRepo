public class DiscountCalculator {

    @TestVisible
static Decimal calculateDiscount(Id oppId){
    
    Opportunity opp = [SELECT Id, Amount, Account.Rating
                       FROM Opportunity 
                       WHERE Id=: oppId];
    
    Decimal discount = 0;
    
    if (opp.Account.Rating == 'Hot '){
        discount = opp.Amount*0.1;
        
        
       
    } else if (opp.Account.Rating == 'Warm '){
        discount = opp.Amount*0.05;
        
    }else {
        
        discount = 0;
        
    }        
    
    return discount;
}
}