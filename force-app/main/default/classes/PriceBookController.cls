public with sharing class PriceBookController {
            public List<PricebookEntry> pricebook { get; set; }
            
            public PriceBookController() {
                // Query all products and retrieve necessary fields
                pricebook = [SELECT Product2Id, UnitPrice FROM PricebookEntry ORDER BY Product2Id];
                }
            }