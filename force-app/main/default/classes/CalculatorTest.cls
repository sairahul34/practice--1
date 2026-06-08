/**
 * @description Test class for Calculator. Covers all arithmetic operations
 * and edge cases including division by zero.
 */
@isTest
private class CalculatorTest {

    private static final Integer FIRST_NUMBER  = 10;
    private static final Integer SECOND_NUMBER = 5;

    /**
     * @description Verifies that add() returns the correct sum.
     */
    @isTest
    static void testAddPositiveNumbers() {
        // Act
        Test.startTest();
        Integer result = Calculator.add(FIRST_NUMBER, SECOND_NUMBER);
        Test.stopTest();

        // Assert
        Integer expectedResult = 15;
        System.assertEquals(expectedResult, result, 'Expected sum to be 15');
    }

    /**
     * @description Verifies that subtract() returns the correct difference.
     */
    @isTest
    static void testSubtractPositiveNumbers() {
        // Act
        Test.startTest();
        Integer result = Calculator.subtract(FIRST_NUMBER, SECOND_NUMBER);
        Test.stopTest();

        // Assert
        Integer expectedResult = 5;
        System.assertEquals(expectedResult, result, 'Expected difference to be 5');
    }

    /**
     * @description Verifies that multiply() returns the correct product.
     */
    @isTest
    static void testMultiplyPositiveNumbers() {
        // Act
        Test.startTest();
        Integer result = Calculator.multiply(FIRST_NUMBER, SECOND_NUMBER);
        Test.stopTest();

        // Assert
        Integer expectedResult = 50;
        System.assertEquals(expectedResult, result, 'Expected product to be 50');
    }

    /**
     * @description Verifies that divide() returns the correct quotient.
     */
    @isTest
    static void testDividePositiveNumbers() {
        // Arrange
        Decimal dividend = 10;
        Decimal divisor  = 2;

        // Act
        Test.startTest();
        Decimal result = Calculator.divide(dividend, divisor);
        Test.stopTest();

        // Assert
        Decimal expectedResult = 5;
        System.assertEquals(expectedResult, result, 'Expected quotient to be 5');
    }

    /**
     * @description Verifies that divide() throws IllegalArgumentException when divisor is zero.
     */
    @isTest
    static void testDivideByZeroThrowsException() {
        // Arrange
        Decimal dividend        = 10;
        Decimal divisor         = 0;
        Boolean exceptionThrown = false;
        String  exceptionMsg    = '';

        // Act
        Test.startTest();
        try {
            Calculator.divide(dividend, divisor);
        } catch (IllegalArgumentException ex) {
            exceptionThrown = true;
            exceptionMsg    = ex.getMessage();
        }
        Test.stopTest();

        // Assert
        System.assert(exceptionThrown, 'Expected IllegalArgumentException to be thrown for divide by zero');
        System.assertEquals('Cannot divide by zero.', exceptionMsg, 'Exception message does not match expected value');
    }

    /**
     * @description Verifies that add() works correctly with negative numbers.
     */
    @isTest
    static void testAddNegativeNumbers() {
        // Arrange
        Integer negativeFirst  = -4;
        Integer negativeSecond = -6;

        // Act
        Test.startTest();
        Integer result = Calculator.add(negativeFirst, negativeSecond);
        Test.stopTest();

        // Assert
        Integer expectedResult = -10;
        System.assertEquals(expectedResult, result, 'Expected sum of negatives to be -10');
    }

    /**
     * @description Verifies that multiply() with zero returns zero.
     */
    @isTest
    static void testMultiplyByZero() {
        // Arrange
        Integer zero = 0;

        // Act
        Test.startTest();
        Integer result = Calculator.multiply(FIRST_NUMBER, zero);
        Test.stopTest();

        // Assert
        Integer expectedResult = 0;
        System.assertEquals(expectedResult, result, 'Expected product with zero to be 0');
    }
}