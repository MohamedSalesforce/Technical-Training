import { LightningElement } from 'lwc';
import getJoke from "@salesforce/apex/CallingJoke.getJoke";

export default class JokeCapture extends LightningElement {
    joke;

    handleClick(event){
        //console.log('Button Clicked');
        getJoke()
            .then((response) => {
                this.joke = response;
                console.log(this.joke);
            })
            .catch((error) => {
                console.error('Error fetching joke', error);
            });
    }
}
