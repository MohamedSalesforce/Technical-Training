import { LightningElement } from 'lwc';

export default class Avatarcomponent extends LightningElement {
    clicked = false;

    handleClick(event){
        this.clicked = true;
    }
}