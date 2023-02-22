import { LightningElement } from 'lwc';

export default class ButtonBasic extends LightningElement {
    textValue;

    handleClick(event) {
        alert("You resetted the name");
        this.textValue="User";
    }
}
