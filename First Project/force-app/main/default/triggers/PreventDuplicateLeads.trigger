trigger PreventDuplicateLeads on Lead (before insert) {
   
    
    for (Lead newLead : Trigger.new) {
        // Query for existing leads with the same first and last name
        Lead existingLead = [SELECT Id FROM Lead WHERE FirstName = :newLead.FirstName AND LastName = :newLead.LastName];
        if (existingLead != null) {
            // Add an error to the new lead's first name field
            newLead.FirstName.addError('A lead with the same first and last name already exists.');
        }
    }
}
