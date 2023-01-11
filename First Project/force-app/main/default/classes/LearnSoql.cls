public class LearnSoql {
    public static void updateAcc(String str){
        
        List<Account> newAccs = new List<Account>();
        
        for(Account acc: [SELECT Id, Name FROM Account WHERE Name =: str]){
            acc.Description = 'Test2';
            newAccs.add(acc);
        }
        update newAccs;
    }
}