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
            }
