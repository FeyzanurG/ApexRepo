public class MyClass {
    public static void newAcct(){
        Account acc = new Account();
        acc.Name = 'Salesforce3';
        insert acc; 
        //with this insert method, we created an account
        //if you wont use DML statement there will be no change in the database,
        //everything stays in the memory
    }
    public static void updateAcct(){
        Account acc1 = [SELECT Id,Name FROM Account WHERE Name = 'Salesforce3'];
        acc1.Name = 'New Salesforce'; //update yapabilmek icin yeni bi variable a need var
        update acc1;
        //burda da ekledigimiz account ismini degistirdik update methodla
    }
}