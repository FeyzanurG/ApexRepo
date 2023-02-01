public class GetterSetterVF {
    public String fName {set; get;}
    public String lName {set; get;}
    public String city {set; get;}
    public String fullInfo {set; get;}
	
    public GetterSetterVF(){
        fName = 'Your name';
        lName = 'Your last name';
        city = 'Your city';
    }
    public PageReference concatenate(){
        fullInfo = fName + ' ' + lName + ' from' + city;
        return null;
    }
    
}