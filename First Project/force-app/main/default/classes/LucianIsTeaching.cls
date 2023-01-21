public class LucianIsTeaching {
    public static void insAcc(){
        List<Account> listAcc = new List<Account>();
        for(Integer i=1; i<6; i++){
            Account acc = new Account();
            acc.Name = 'Cohort ' +i;
            listAcc.add(acc);
        }
        upsert listAcc;
    
    	List<Contact> ListCon = new List<Contact>();
    	for(Account acc1:listAcc){
        Contact con = new Contact();
            con.LastName = acc1.Name;
            con.AccountId = con.Id;
            listCon.add(con);
		}
    	upsert listCon;
        List<Opportunity> listOpp = new List<Opportunity>();
        for(Account acc2:listAcc){
        Opportunity opp = new Opportunity();
            opp.Name = acc2.Name;
            opp.CloseDate = date.today();
            opp.StageName = 'Closed Won';
            opp.AccountId = opp.Id;
            listOpp.add(opp);
        }
        upsert listOpp;
	}
}