import { LightningElement } from 'lwc';
import createContact from '@salesforce/apex/DisplayEmployees.createContact';

export default class DisplayEmployees extends LightningElement {
    firstName;
    lastName;
    email;
    phone;
    accountId;

    connectedCallback(){
        console.log("Mohamed Samsudeen")
        console.log(this.firstName);
        console.log(this.lastName);
        console.log(this.email);
        console.log(this.phone);
    }

    dataform(event){
       this[event.target.name] = event.target.value;
    }
    handleClick(){
        console.log(this.firstName);
        console.log(this.lastName);
        console.log(this.email);
        console.log(this.phone);
        console.log(this.accountId);
    
        createAccount({Name : this.accountName })
        .then(data=>{
            console.log(data.Id);
            this.accountId=data.Id;
        })
        .catch(error=>{
            console.log(error);
        })
    
    
        createContact({firstName : this.firstName, lastName : this.lastName, email : this.email, phone : this.phone, accountId :this.accountId})
        .then(data=>{
            console.log(data);
        })
        .catch(error=>{
            console.log(error);
        })

    }
}