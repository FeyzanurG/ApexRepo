public class FirstClass {
    
    public Integer classNumber = 50; 
    private static String userName;

    public static void setUserName(String newUserName){
        userName=newUserName; 
    }
   
    public static String getUserName(){
        return userName;
    }
        
    public static void welcome(){
        if(String.isNotBlank(username)){
            System.debug('Hello Apex Class ' + userName);
        }else{
           System.debug('Hello Bro..' ); 
        }
    }
    public static void numbers(){
        Integer.format(classNumber);
    }
}