import { LightningElement, wire } from 'lwc';
import product from "@salesforce/apex/WireProductRetrieve.product"

export default class WireProductDetails extends LightningElement {

    show = false;
    prodList;
    unitPrice;
    listProd;

    @wire(product)
    productPrice({error,data})
    {
        if(data)
        {
            console.log(data);
            this.listProd = data;
            this.prodList = data.map(item =>{
                
                console.log(item);
                // return{
                //     ...item,
                //     listOfProduct : this.listProd(item.Name)
                // };
                this.unitPrice = item.UnitPrice;
                console.log(this.unitPrice);

            });
        }
        else    
        {
            console.log(error);
        }
    }

    handleClick()
    {
        console.log('button clicked');
        console.log(this.unitPrice);
    }
}