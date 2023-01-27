trigger CampaignDate on Campaign (before update) {
    for(Campaign cmpOld: Trigger.old){
        for(Campaign cmpNew: Trigger.new){
            if(cmpOld.Id == cmpNew.Id && cmpOld.StartDate != cmpNew.StartDate){
                cmpNew.addError('You cannot change campaign start date, please contact your Admin');
            }
        }
    }
}