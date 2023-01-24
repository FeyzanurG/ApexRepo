@isTest
public class TestDataFactory {
    public static List<Account> createAccs(Integer num){
    	List<Account> listAccs = new List<Account>();
        for(Integer i=0; i<num; i++){
            Account a = new Account(Name = 'Triforcia ' +i);
            a.Type = 'Prospect';
            listAccs.add(a);
        }
    insert listAccs;
    return listAccs;
    }
    
    public static List<Contact> createCons(Integer num){
    	List<Contact> listCons = new List<Contact>();
        for(Integer i=0; i<num; i++){
            Contact a = new Contact(LastName = 'Triforcia ' +i);
            listCons.add(a);
        }
    insert listCons;
    return listCons;
    }
}