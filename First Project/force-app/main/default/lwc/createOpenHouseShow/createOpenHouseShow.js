import { LightningElement } from 'lwc';
import OPENHOUSESHOW_OBJECT from '@salesforce/schema/Open_House_Show__c';

/**
 * Creates Account records.
 */
export default class ShowVisitorCreator extends LightningElement {

    openHouseShowObject = OPENHOUSESHOW_OBJECT;
    openHouseShowFields = [
        "Open_House__c",
        "Show_Type__c",
        "Is_Live_Show__c",
        "Is_Published__c",
        "Max_Number_of_Visitor__c",
        "Show_Date__c",
        "Start_Time__c",
        "End_Time__c"
        
    ];

}