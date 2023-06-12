import { LightningElement, track } from 'lwc';
  import { createRecord } from 'lightning/uiRecordApi';
  import style from './connectionForm.css';



  const CONNECTIONS_OBJECT = 'ConnectionsExpCloud__c';

  export default class ConnectionForm extends LightningElement {
    @track name = '';
    @track email = '';
    @track linkedin = '';
    @track trailhead = '';
    @track comment = '';

    handleNameChange(event) {
      this.name = event.target.value;
    }

    handleEmailChange(event) {
      this.email = event.target.value;
    }

    handleLinkedinChange(event) {
      this.linkedin = event.target.value;
    }

    handleTrailheadChange(event) {
      this.trailhead = event.target.value;
    }

    handleCommentChange(event) {
      this.comment = event.target.value;
    }

    async handleConnect() {
      const fields = {
        Name: this.name,
        Email__c: this.email,
        LinkedIn_Profile__c: this.linkedin,
        Trailhead_Profile__c: this.trailhead,
        Comment__c: this.comment
      };
      try {
        await createRecord({ apiName: CONNECTIONS_OBJECT, fields });
        const confetti = this.template.querySelector('.confetti');
        confetti.dispatchEvent(new CustomEvent('fireconfetti'));
      } catch (error) {
        console.error(error);
      }
    }
  }