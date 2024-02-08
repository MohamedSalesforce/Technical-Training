import { LightningElement, track } from 'lwc';
import searchProducts from '@salesforce/apex/ProductFilterHelper.searchProducts';

export default class ProductFilter extends LightningElement {
    @track productFamily = '';
    @track products = [];

    handleInputChange(event) {
        this.productFamily = event.target.value;
    }

    searchProducts() {
        // Call Apex method to search for products by product family
        searchProducts({ productFamily: this.productFamily })
            .then(result => {
                this.products = result;
            })
            .catch(error => {
                // Handle any errors
                console.error(error);
            });
    }
}