import { LightningElement, wire } from 'lwc';
import  returnGetContact from '@salesforce/apex/EmployeeMasterPage.returnGetContact';

export default class EmployeeMasterPage extends LightningElement {
    contactsList;

    connectedCallback(){
        returngetContact()
        .then(data =>{
      this.contactList=data;
            console.log(data);
        })
        .catch(error =>{
            console.log(error);
        })
    }
    
    // @wire(returnGetContact)
    //     wiredContacts({ error, data}){
    //         if(data){
    //             this.contactsList=data;
    //             console.log(this.contactsList);
    //             //this.error=undefined;
    //         }
    //         else if(error){
    //             //this.error=error;
    //             this.contactList=undefined;
    //             console.log(error);
    //         }
    //     }

    // get returnGetContact(){
    //     returnGetContact()
    //     .then(data =>{
    //         this.contactList=data;
    //         console.log(this.contactList);
    //             })
    //     .catch(error =>{
    //         console.log(error);
    //             })
    // }

    get fetchListOfContacts(){
        return this.contactList;
    }
}