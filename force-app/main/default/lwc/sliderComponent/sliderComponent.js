import { LightningElement } from 'lwc';

export default class SliderComponent extends LightningElement {
    myValue;
    val;
    show = false;

    handleInput(event) {
        this.val= event.target.value;
    }

    handleClick(event){
        this.show=true;
        this.myValue = this.val;
    }
}