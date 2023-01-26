public class FutureMethodExample {
    
    @future
    public static void myFutureMethod(String firstName, Integer age){
        System.debug('My name is ' + firstName + ' and my age is ' + age + '.');
    }
    public static void regularMethod(String firstName, Integer age){
        System.debug('My name is ' + firstName + ' and my age is ' + age + '.');
    }
}