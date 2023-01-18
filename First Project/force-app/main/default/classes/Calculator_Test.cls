@isTest //this is a must
public class Calculator_Test {
    //create test/mock data
    //run the actual code(from real class) with this data
    //use system.assert method to check data
    @isTest static void  sum_Test(){ //test classes doesnt have parametres(arguments)
        Integer result = Calculator.sum(2,2);
        System.assertEquals(4, result, 'The result is not true, they are not equal');    
     }
    @isTest static void  subtract_Test(){ 
        Integer result1 = Calculator.subtract(2,2);
        System.assertEquals(0, result1, 'The result is not true, they are not equal');    
     }
    @isTest static void  multiply_Test(){ 
        Integer result2 = Calculator.multiply(2,2);
        System.assertEquals(4, result2, 'The result is not true, they are not equal');    
     }
    @isTest static void  divide_Test(){ 
        Integer result3 = Calculator.divide(2,2);
        System.assertEquals(1, result3, 'The result is not true, they are not equal');    
     }
}