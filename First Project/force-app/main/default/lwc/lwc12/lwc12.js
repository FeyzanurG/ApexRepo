import { LightningElement, wire } from 'lwc';
import getAccountList from '@salesforce/apex/GetAccount.getAccountList';

export default class Lwc12 extends LightningElement {
    @wire(getAccountList) Account;
}