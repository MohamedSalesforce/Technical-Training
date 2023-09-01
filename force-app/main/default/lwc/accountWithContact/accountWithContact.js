import { LightningElement } from 'lwc';
import getAccountsWithContacts from '@salesforce/apex/AccountAssociatedToContact.getAccountsWithContacts';

export default class AccountWithContacts extends LightningElement {

    accountsWithContacts;

    connectedCallback(){
        getAccountsWithContacts()
        .then(data =>{
            this.accountsWithContacts = data;
            console.log(accountsWithContacts);
        })
        .catch(error =>{
            console.log(error);
        })
    }
}