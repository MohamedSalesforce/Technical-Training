import { LightningElement } from 'lwc';
//import mainHTML from './renderComponent.html'
import secondTemplate from './render2.html';
import thirdTemplate from './render3.html';
 
export default class RenderComponent extends LightningElement {
 
    show = false;
    handleClick()
    {
        this.show = !this.show;
    }
    render()
    {
        return this.show===true ? secondTemplate : thirdTemplate;
    }
}