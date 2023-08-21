import { LightningElement } from 'lwc';

export default class DisplayCalculator extends LightningElement {

    @track displayText = '';
    @track numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];
    @track currentNumber = '';
    @track currentOperation = '';
    @track previousNumber = '';

    handleNumberClick(event) {
        this.currentNumber += event.target.dataset.number;
        this.displayText = this.currentNumber;
    }

    handleOperationClick(event) {
        this.previousNumber = this.currentNumber;
        this.currentNumber = '';
        this.currentOperation = event.target.dataset.operation;
    }

    handleClearClick() {
        this.currentNumber = '';
        this.previousNumber = '';
        this.currentOperation = '';
        this.displayText = '';
    }

    handleOperationClick() {
        const num1 = parseFloat(this.previousNumber);
        const num2 = parseFloat(this.currentNumber);
        let result;

        switch (this.currentOperation) {
            case '+':
                result = num1 + num2;
                break;
            case '-':
                result = num1 - num2;
                break;
            case '*':
                result = num1 * num2;
                break;
            case '/':
                result = num1 / num2;
                break;
            default:
                break;
        }

        this.displayText = result.toString();
        this.currentNumber = result.toString();
        this.previousNumber = '';
        this.currentOperation = '';
    }
}