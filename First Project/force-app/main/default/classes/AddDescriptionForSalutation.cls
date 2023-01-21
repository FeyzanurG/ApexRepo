public class AddDescriptionForSalutation {
    public static void contactCreator(String conSalutation, String conLName){
            Contact con = new Contact();
            con.LastName = conLName;
            con.salutation = conSalutation;
            insert con;
        }
        public static String conSalutationDesc(String conLName){
            Contact oneCont = [SELECT LastName, Id, Salutation, Description FROM Contact WHERE name =:conLName LIMIT 1];
            if(oneCont.Salutation == 'Mr.'){
                oneCont.Description = 'This salutation is used for a man that we don\'t know his marital status';
            }else if(oneCont.Salutation == 'Ms.'){
                oneCont.Description = 'This salutation is used for a woman that we don\'t know her marital status';
            }else if(oneCont.Salutation == 'Mrs.'){
                oneCont.Description = 'This salutation is used for a woman who is married';
             }else if(oneCont.Salutation == 'Dr.'){
                oneCont.Description = 'This salutation is used for a man/woman who is educated';
            }else{
                oneCont.Description = 'This salutation is used for a man/woman who is well educated';
            }
            update oneCont;
            return oneCont.Description;
        }
    }