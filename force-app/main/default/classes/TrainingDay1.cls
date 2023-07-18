public with sharing class TrainingDay1 {
        
        public static void Calculation(){
            for (Integer i = 1; i <= 100; i++) {
                if (Math.mod(i, 9) != 0) {
                    System.debug(i);
                }
            }
        }
            public static Integer addNumbers(Integer num1, Integer num2) {
                Integer sum = num1 + num2;
                return sum;
            }

                public static void printPyramidNumbers() {
                    Integer currentNumber = 1;
                    for (Integer row = 1; row <= 4; row++) {
                        String nm = ' ';
                        for (Integer column = 1; column <=row; column++) {
                            if(column<=row){
                                nm = nm+currentNumber;
                                currentNumber++;
                            }
                            
                        }
                        System.debug(nm);
                    }
                }
                public static void reverseWord(){
                    String orignalName = 'Mohamed Samsudeen';
                    String reversedName = orignalName.reverse();
                    System.debug(reversedName);
                }


             public static void getPrime(){
                    integer x=0;
                    for(x=0;x<=100;x++){
                        integer count=0;
                        integer y=0;
                        for( y=x; y>=1;y--){
                            if(math.mod(x,y)==0 ){
                                count++;
                            }
                        }
                        if(count==2 || count==1){
                            system.debug(x);                  
                        }                       
                    }
            }

        public static lead createLeadRecord(){
            lead newlead = new lead();
            newlead.Lastname = 'raja'; 
            newlead.Email = 'raja@gmail.com';
            newlead.Company = '4i Apps';
            insert newlead;
            return newlead;
        }

        public static lead birthDayValidation(String lastName, String email, Date dateOfBirth, String companyName) {
            if (dateOfBirth == null) {
                Date myDate = Date.newInstance(1990, 1, 1);
                dateOfBirth = myDate;
            }
            Lead leadRecordToInsert = new Lead();
            leadRecordToInsert.LastName = lastName;
            leadRecordToInsert.Email = email;
            leadRecordToInsert.DOB__c = dateOfBirth; 
            leadRecordToInsert.Company = companyName;
            insert leadRecordToInsert;
            return leadRecordToInsert;
        }
        
        public static lead createnewlead(String lastname, String email, String company){
            lead newleadrecord = new lead(Lastname = lastname, Email = email, Company = company);
            insert newleadrecord;
            return newleadrecord;
        }

        public static void createAccountWithContact() {
            // Create an Account
            Account newAccount = new Account();
            newAccount.Name = 'Retro Games';
            newAccount.Description = 'Game Account';
            // Set other desired Account fields
    
            // Create a Contact
            Contact newContact = new Contact();
            newContact.FirstName = 'Ethen';
            newContact.LastName = 'Hunt';
            newContact.Email = 'ethenhunt@retro.com';
            // Set other desired Contact fields
    
            // Associate the Contact with the Account
            newContact.AccountId = newAccount.Id;
    
            // Insert the Account and Contact
            insert newAccount;
            insert newContact;
        }

        public static List<Lead> createLeadsInBulk() {
            List<Lead> leadsToCreate = new List<Lead>();
            
            for(Integer i = 0; i < 10; i++) {
                Lead lead = new Lead(
                    FirstName = 'Ethen', // Default first name
                    LastName = 'Hunt', // Default last name
                    Company = '4i Apps' // Default company name
                );
                leadsToCreate.add(lead);
            }
            
            insert leadsToCreate;
            return leadsToCreate;
        }

}