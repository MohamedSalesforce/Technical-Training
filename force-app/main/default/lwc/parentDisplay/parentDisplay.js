import { LightningElement } from 'lwc';
import getContacts from '@salesforce/apex/ParentContact.getContacts';

export default class ParentDisplay extends LightningElement {
    contactName;
    contactPhone;
    contactList;

    connectedCallback(){
        getContacts()
        .then(data =>{
            this.contactList=data;
            console.log(data);
        })
        .catch(error =>{
            console.log(error);
        })
        }

    captureContactInformation(contactName, contactPhone){
        this.contactName = contactName;
        this.contactPhone = contactPhone;
    }

    // captureContactInformation(contactName, contactPhone){
    //     this.contactName = contactName;
    //     this.contactPhone = contactPhone;
    //     console.log("Method Executed :");
           
    }