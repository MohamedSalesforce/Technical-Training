import { LightningElement, track } from 'lwc';

export default class Smalllettertocapitalletter extends LightningElement {
    @track finalval = '';
    inputVal = '';

    handleChange(event) {
        this.inputVal = event.target.value;
    }

    handleClick() {
        this.finalval = this.inputVal.toUpperCase();
    }
}