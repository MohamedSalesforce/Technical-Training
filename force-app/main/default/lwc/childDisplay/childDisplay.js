import { LightningElement , api} from 'lwc';

export default class ChildDisplay extends LightningElement {
    @api 
    contactName;
    @api
    contactPhone;

    handleInvoke(){
        console.log(this.contactName);
        console.log(this.contactPhone);
        this.dispatchEvent(new CustomEvent('contactinvoke'));
    }
}