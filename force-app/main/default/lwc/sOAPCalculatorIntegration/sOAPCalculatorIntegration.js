import { LightningElement } from 'lwc';
import addTwoNumbers from "@salesforce/apex/CalculatorClassController.addTwoNumbers";
import subTwoNumbers from "@salesforce/apex/CalculatorClassController.subTwoNumbers";
import mulTwoNumbers from "@salesforce/apex/CalculatorClassController.mulTwoNumbers";
import divTwoNumbers from "@salesforce/apex/CalculatorClassController.divTwoNumbers";

export default class SOAPCalculatorIntegration extends LightningElement {    
    number1 ;
    number2 ;
    result ;

    handleNumberChange1(event)
    {
        this.number1=event.target.value;
    }

    handleNumberChange2(event)
    {
        this.number2=event.target.value;
    }

    handleOperationAddition(event)
    {
        addTwoNumbers({ input1: this.number1, input2: this.number2 })
        .then(result => {
            this.result = result;
        })
        .catch(error => {
            console.error('Error performing calculation', error);
        });
    }

    handleOperationSubraction(event)
    {
        subTwoNumbers({ input1: this.number1, input2: this.number2 })
        .then(result => {
            this.result = result;
        })
        .catch(error => {
            console.error('Error performing calculation', error);
        });
    }

    handleOperationMultiplication(event)
    {
        mulTwoNumbers({ input1: this.number1, input2: this.number2 })
        .then(result => {
            this.result = result;
        })
        .catch(error => {
            console.error('Error performing calculation', error);
        });
    }

    handleOperationDivision(event)
    {
        divTwoNumbers({ input1: this.number1, input2: this.number2 })
        .then(result => {
            this.result = result;
        })
        .catch(error => {
            console.error('Error performing calculation', error);
        });
    }

    clear(event)
    {
        this.number1 = null;
        this.number2 = null;
        this.result = null;
    }
}