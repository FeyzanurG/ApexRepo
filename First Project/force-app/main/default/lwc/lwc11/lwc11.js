import { LightningElement } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';

/**
 * Creates Account records.
 */
export default class AccountCreator extends LightningElement {

    accountObject = ACCOUNT_OBJECT;
    myFields = ["Name", "Phone", "Email", "Industry", "Type"];

}