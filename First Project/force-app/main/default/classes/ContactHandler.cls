public class ContactHandler {
    public static void beforeInsert(List<Contact> conList){
        for(Contact c: conList){
            c.Description = 'Updated by Contact Trigger';
        }
    }
     public static void beforeUpdate(List<Contact> conList){
        for(Contact c: conList){
            c.Description = 'Change made by ' + UserInfo.getName();
        }
    }
}