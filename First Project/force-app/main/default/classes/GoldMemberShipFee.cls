public class GoldMembershipFee implements MembershipFee {
    Public Decimal discount(){
         Decimal discountPercentage = .10; //flat 10% discount
        System.debug('The discount is ' + discountPercentage*100 + '%');
         return discountPercentage;
     }
    Public Integer paymentNumber(){
         Integer numberOfPayments = 12; //monthly payment
        System.debug('The payment will be monthly');
         return numberOfPayments;
     }
     Public void badge(){
         System.debug('Gold badge');
     }
 } //inheritance example