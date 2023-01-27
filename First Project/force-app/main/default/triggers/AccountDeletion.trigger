trigger AccountDeletion on Account (before delete) {
    for(Account acc: Trigger.old){
        List<Contact> relatedCon = [SELECT Id FROM Contact WHERE AccountId =: acc.id];
        if(!relatedCon.isEmpty()){
            acc.addError('You can\'t delete an Account which has a related Contact');
        }
    }
}