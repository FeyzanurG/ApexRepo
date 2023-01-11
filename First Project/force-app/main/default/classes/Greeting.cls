public class Greeting {
    String firstName = 'Feyzanur';
    public String fullName(){ 
        String lastName = 'Gencay';
        String fName = firstName + ' ' + lastName;
        return fName;
    }
    public String greeting(){
        String greeting = 'Hello';
        String greet = (greeting + ' ' + fullName());
        return greet;
    }
    public void greetingAll(List<String> nameList){
        for(String hello: nameList){
            System.debug('Hello ' + hello);
        }
	}
    public void greetingAllButLast(List<String> nameList){
        for(String exceptLast: nameList){
            System.debug('Hello ' + exceptLast.split(' ',2)[0]);
        }
    }
    public void greetingToFatmanur(List<String> nameList){
        for(String toFatmanur: nameList){
            String test = toFatmanur.split(' ',2)[0];
            if(test == 'Fatmanur'){
                System.debug('Hello ' +toFatmanur.split(' ',2)[0]);
            }else { }
        }
    }
}