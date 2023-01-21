@isTest
public class AddDescriptionForSalutation_Test {
@isTest
    static void contactCreator_Test(){
        String lName = 'Test Contact';
        String conSalutation = 'Mr.';
        AddDescriptionForSalutation.contactCreator(conSalutation,lName);
        
        Contact createdContact = [SELECT LastName, Description FROM Contact WHERE LastName=: lName LIMIT 1];
        createdContact.Description = 'This salutation is used for a man that we don\'t know his marital status';
        Assert.areEqual('This salutation is used for a man that we don\'t know his marital status', createdContact.Description, 'Not true');
        Assert.areEqual('Mr. Test Contact', createdContact.LastName);
    }
}