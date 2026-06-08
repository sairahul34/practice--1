/**
 * @description Test class for Calculator utility.
 */
@isTest
private class CalculatorTest {

    /**
     * @description Tests the add method with positive integers.
     */
    @isTest
    static void testAdd() {
        // Arrange
        Integer firstNumber = 5;
        Integer secondNumber = 3;

        // Act
        Test.startTest();
        Integer result = Calculator.add(firstNumber, secondNumber);
        Test.stopTest();

        // Assert
        System.assertEquals(8, result, 'Addition result should be 8');
    }

    /**
     * @description Tests the subtract method.
     */
    @isTest
    static void testSubtract() {
        // Arrange
        Integer firstNumber = 10;
        Integer secondNumber = 4;

        // Act
        Test.startTest();
        Integer result = Calculator.subtract(firstNumber, secondNumber);
        Test.stopTest();

        // Assert
        System.assertEquals(6, result, 'Subtraction result should be 6');
    }

    /**
     * @description Tests the multiply method.
     */
    @isTest
    static void testMultiply() {
        // Arrange
        Integer firstNumber = 4;
        Integer secondNumber = 3;

        // Act
        Test.startTest();
        Integer result = Calculator.multiply(firstNumber, secondNumber);
        Test.stopTest();

        // Assert
        System.assertEquals(12, result, 'Multiplication result should be 12');
    }

    /**
     * @description Tests the divide method with valid inputs.
     */
    @isTest
    static void testDivide() {
        // Arrange
        Decimal dividend = 10;
        Decimal divisor = 2;

        // Act
        Test.startTest();
        Decimal result = Calculator.divide(dividend, divisor);
        Test.stopTest();

        // Assert
        System.assertEquals(5, result, 'Division result should be 5');
    }

    /**
     * @description Tests that divide throws an exception when divisor is zero.
     */
    @isTest
    static void testDivideByZero() {
        // Arrange
        Decimal dividend = 10;
        Decimal divisor = 0;
        Boolean exceptionThrown = false;

        // Act
        Test.startTest();
        try {
            Calculator.divide(dividend, divisor);
        } catch (IllegalArgumentException ex) {
            exceptionThrown = true;
            System.assertEquals('Cannot divide by zero.', ex.getMessage(), 'Exception message mismatch');
        }
        Test.stopTest();

        // Assert
        System.assert(exceptionThrown, 'Expected IllegalArgumentException was not thrown');
    }
}