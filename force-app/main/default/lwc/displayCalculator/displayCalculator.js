import { LightningElement } from 'lwc';

export default class Calculator extends LightningElement {
    displayValue = '';

    handleButtonClick(event) {
        this.displayValue += event.target.value;
    }

    calculateResult() {
        try {
            this.displayValue = eval(this.displayValue);
        } catch (error) {
            this.displayValue = 'Error';
        }
    }

    clearDisplay() {
        this.displayValue = '';
    }
}