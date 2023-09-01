import { LightningElement, api } from 'lwc';
import getFiveAccounts from '@salesforce/apex/AccountFetch.getFiveAccounts';

export default class AccountFetchLWC extends LightningElement {
    @api accountName;
    accountList;

    connectedCallback(){
        getFiveAccounts()
        .then(data =>{
            console.log(data);
            this.accountList = data;
        })
        .catch(error =>{
            console.log(error);
        })
    }

    handleClick(event){
        this.accountName = event.target.label;
        console.log(this.accountName);
        // console.log(event.target.label);
    }
}