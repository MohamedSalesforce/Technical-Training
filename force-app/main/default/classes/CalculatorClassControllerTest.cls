@isTest
public class CalculatorClassControllerTest {

    @isTest
    static void testAddTwoNumbers() {
        Integer input1 = 5;
        Integer input2 = 7;
        Integer expected = 12;
        Test.startTest();
        Integer result = CalculatorClassController.addTwoNumbers(input1, input2);
        Test.stopTest();
        System.assertEquals(expected, result);
    }
    
    @isTest
    static void testSubTwoNumbers() {
        Integer input1 = 10;
        Integer input2 = 3;
        Integer expected = 7;
        Test.startTest();
        Integer result = CalculatorClassController.subTwoNumbers(input1, input2);
        Test.stopTest();
        System.assertEquals(expected, result);
    }
    
    @isTest
    static void testMulTwoNumbers() {
        Integer input1 = 4;
        Integer input2 = 6;
        Integer expected = 24;
        Test.startTest();
        Integer result = CalculatorClassController.mulTwoNumbers(input1, input2);
        Test.stopTest();
        System.assertEquals(expected, result);
    }
    
    @isTest
    static void testDivTwoNumbers() {
        Integer input1 = 20;
        Integer input2 = 5;
        Integer expected = 4;
        Test.startTest();
        Integer result = CalculatorClassController.divTwoNumbers(input1, input2);
        Test.stopTest();
        System.assertEquals(expected, result);
    }
}