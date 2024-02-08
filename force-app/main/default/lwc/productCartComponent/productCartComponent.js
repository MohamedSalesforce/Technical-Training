import { LightningElement, wire, track,api } from 'lwc';
import getProductsFromOpportunity from '@salesforce/apex/ProductRetriever.getProductsFromOpportunity';

const fields = ['Opportunity.Product2.Name', 
                'Opportunity.Product2.Description', 
                'Opportunity.Product2.Id', 
                'Opportunity.Product2.Product_Image__c'];

export default class ProductList extends LightningElement {
    @track products = [];
    @track selectedProducts = [];

    @api recordId;

    @wire(getProductsFromOpportunity, { opportunityId: '$recordId' })
    wiredProducts({ error, data }) {
        if (data) {
            this.products = data;
        } else if (error) { 
            console.error(error);
        }
    }

    handleCheckboxChange(event) {
        const productId = event.target.value;
        if (event.target.checked) {
            this.selectedProducts.push(productId);
        } else {
            this.selectedProducts = this.selectedProducts.filter(item => item !== productId);
        }
    }

    addToCart() {
        const opportunityId = this.opportunity.data.fields.Id.value;
        addToCartOnOpportunity({ opportunityId, selectedProducts: this.selectedProducts })
            .then(result => {
                this.selectedProducts = [];
            })
            .catch(error => {
                console.log(error);
            });
    }
}