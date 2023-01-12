public class CreateAccount {
    public static void newAcc(String accName){
        Account acc = new Account();
        acc.Name = accName;
        insert acc;
    }
}