public class SumCalculation {
    public void sumMethod(Integer number1, Integer number2) {
        System.debug('Sum of two numbers is: ' + (number1+number2));
    }
     public void sumMethod(Decimal number1, Decimal number2) {
        System.debug('Sum of two numbers is: ' + (number1+number2));
    } //after the first method, we created this. This is called polymorphism
}