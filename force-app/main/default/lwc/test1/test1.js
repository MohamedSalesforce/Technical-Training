import { LightningElement } from 'lwc';
import LightningAlert from 'lightning/alert';

export default class Test1 extends LightningElement {
    async handleAlertClick() {
        await LightningAlert.open({
            message: 'this is the alert message',
            theme: 'error', // a red theme intended for error states
            label: 'Error!', // this is the header text
        });
        //Alert has been closed
    }
    handleNavigateToCustomPage1(event) {
        event.preventDefault();
        //your custom navigation here
    }
    handleNavigateToCustomPage2(event) {
        event.preventDefault();
        //your custom navigation here
    }
    
    handleNavigateToAccount(event) {
        // prevent default navigation by href
        event.preventDefault();

        const caseDiv = this.template.querySelector('.container .case');
        this.hide(caseDiv);

        const accountDiv = this.template.querySelector('.container .account');
        this.show(accountDiv);
    }

    handleNavigateToCase(event) {
        // prevent default navigation by href
        event.preventDefault();

        const accountDiv = this.template.querySelector('.container .account');
        this.hide(accountDiv);

        const caseDiv = this.template.querySelector('.container .case');
        this.show(caseDiv);
    }

    close(event) {
        const name = event.target.value;
        const elmToClose = this.template.querySelector(`.${name}`);
        this.hide(elmToClose);
    }

    show(elm) {
        elm.classList.remove('slds-hide');
        elm.classList.add('slds-show');
    }

    hide(elm) {
        elm.classList.add('slds-hide');
        elm.classList.remove('slds-show');
    }
}