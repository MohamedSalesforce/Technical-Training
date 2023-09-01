import { LightningElement } from 'lwc';

export default class CalenderFieldSales extends LightningElement {
    createNewRecord() {
        const newRecordInput = {
            apiName: 'Your_Object_API_Name__c',
            fields: {
                Your_Field_Name__c: 'Some Value'
                // Add more fields here
            }
        };

        createRecord(newRecordInput)
            .then(result => {
                console.log('Record created successfully:', result.id);
                // Implement any further logic you need
            })
            .catch(error => {
                console.error('Error creating record:', error);
                // Implement error handling
            });
}
}