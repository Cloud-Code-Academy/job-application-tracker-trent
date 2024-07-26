import { LightningElement, track, wire } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import getJobApplications from '@salesforce/apex/JobApplicationController.getJobApplications';

const actions = [
    { label: 'View', name: 'view' }
];

export default class JobApplications extends NavigationMixin(LightningElement) {


    @track columns = [
        { label: 'Name', fieldName: 'Name' },
        { label: 'Status', fieldName: 'Status__c' },
        { label: 'Job Title', fieldName: 'Job_Title__c'},
        { label: 'URL', fieldName: 'URL__c'},
        {
            type: 'action',
            typeAttributes: { rowActions: actions, menuAlignment: 'right' }
        }
    ];
    @track jobApplicationList;

    @wire(getJobApplications)
    wiredAccounts({ error, data }) {
        if (data) {
            this.jobApplicationList = data;
        } else if (error) {
            this.error = error;
        }
    }
    handleRowAction(event) {
        const actionName = event.detail.action.name;
        const row = event.detail.row;
        
        switch (actionName) {
            case 'view':
                this[NavigationMixin.Navigate]({
                    type: 'standard__recordPage',
                    attributes: {
                        recordId: row.Id,
                        actionName: 'view'
                    }
                });
                break;
            case 'delete':
                // Implement delete logic here
                break;
            default:
                break;
}
    }
}
