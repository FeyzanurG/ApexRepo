public class MyClass {
    public static void newAcct(){
        Account acc = new Account();
        acc.Name = 'Salesforce3';
        insert acc; 
        
    }
    public static void updateAcct(){
        Account acc1 = [SELECT Id,Name FROM Account WHERE Name = 'Salesforce3'];
        acc1.Name = 'New Salesforce'; 
        update acc1;
    }
}