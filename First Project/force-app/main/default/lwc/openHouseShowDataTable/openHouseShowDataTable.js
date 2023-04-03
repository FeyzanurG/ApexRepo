import { LightningElement ,api, wire, track} from 'lwc';
import getOpenHouseShowList from '@salesforce/apex/getOpenHouseShowData.getOpenHouseShowList';
export default class getOpenHouseShowDataTable extends LightningElement {
    @track columns = [{
            label: 'Address',
            fieldName: 'Name',
            type: 'Text',
            sortable: true
        },
        {
            label: 'Show Date',
            fieldName: 'Show_Date__c',
            type: 'date',
            sortable: true
        },
        {
            label: 'Start Time',
            fieldName: 'Start_Time__c',
            type: 'date',
            typeAttributes:{
                hour: "2-digit",
                minute: "2-digit"
            },
            sortable: true
        },
        {
            label: 'End Time',
            fieldName: 'End_Time__c',
            type: 'date',
            typeAttributes:{
                hour: "2-digit",
                minute: "2-digit"
            },
            sortable: true
        },
        {
            label: 'Remaining Number of Visitors',
            fieldName: 'Remaining_Number_Visitors__c',
            type: 'Number',
            sortable: true
        }
    ];
 
    @track error;
    @track ohsList ;
    @wire(getOpenHouseShowList)
    wiredOpenHouseShows({
        error,
        data
    }) {
        if (data) {
            this.ohsList = data;
        } else if (error) {
            this.error = error;
        }
    }
}