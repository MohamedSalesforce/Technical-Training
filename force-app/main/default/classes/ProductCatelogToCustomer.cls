public with sharing class ProductCatelogToCustomer {
        public List<Product2> products { get; set; }
        
        public ProductCatelogToCustomer() {
            // Fetch products from the Product object
            products = [SELECT Id, Name, Description, Product_Image__C FROM Product2 WHERE Name IN ('Razer Black Widow', 'Razer Naga', 'Razer Leviathan Soundbar', 'Razer BlackShark')];
        }
    }
