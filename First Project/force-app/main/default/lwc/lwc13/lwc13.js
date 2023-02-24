import { LightningElement,api } from 'lwc';

export default class Lwc13 extends LightningElement {
    @api richtext;
    @api richtextLabel;

    handleChange(event) {
        this.richtext = event.detail.value;
    }
}