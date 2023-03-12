import { LightningElement, api } from 'lwc';
import NAME_FIELD from '@salesforce/schema/Visitor__c.Name';
import EMAIL_FIELD from '@salesforce/schema/Visitor__c.Email';

export default class InvitationForm extends LightningElement {

    nameField = NAME_FIELD;
    emailField = EMAIL_FIELD;

    @api recordId;
    @api 

    connectedCallback() {
        if (this.Visitor__c.data) {
            this.Visitor__c = getFieldValue(this.Visitor__c.data, 'Visitor__c.Name');
        }
    }

    handleVisitorNameChange(event) {
        this.visitorName = event.target.value;
    }

    handleVisitorEmailChange(event) {
        this.visitorEmail = event.target.value;
    }

    handleOpenHouseShowChange(event) {
        this.openHouseShow = event.target.value;
    }

    handleSubmit() {
        // perform form submission logic here
    }
}
