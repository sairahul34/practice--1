/**
 * @description Test class for the Calculator utility class.
 * Validates all arithmetic operations and edge cases.
 */
@isTest
private class CalculatorTest {

    private static final Integer AUGEND        = 10;
    private static final Integer ADDEND        = 5;
    private static final Integer MULTIPLICAND  = 4;
    private static final Integer MULTIPLIER    = 3;
    private static final Integer MINUEND       = 10;
    private static final Integer SUBTRAHEND    = 4;

    /**
     * @description Verifies add() returns correct sum of two positive integers.
     */
    @isTest
    static void testAddReturnsCorrectSum() {
        Integer expectedSum = 15;

        Test.startTest();
        Integer actualSum = Calculator.add(AUGEND, ADDEND);
        Test.stopTest();

        System.assertEquals(expectedSum, actualSum, 'add() should return 15 for inputs 10 and 5');
    }

    /**
     * @description Verifies subtract() returns correct difference of two integers.
     */
    @isTest
    static void testSubtractReturnsCorrectDifference() {
        Integer expectedDifference = 6;

        Test.startTest();
        Integer actualDifference = Calculator.subtract(MINUEND, SUBTRAHEND);
        Test.stopTest();

        System.assertEquals(expectedDifference, actualDifference, 'subtract() should return 6 for inputs 10 and 4');
    }

    /**
     * @description Verifies multiply() returns correct product of two integers.
     */
    @isTest
    static void testMultiplyReturnsCorrectProduct() {
        Integer expectedProduct = 12;

        Test.startTest();
        Integer actualProduct = Calculator.multiply(MULTIPLICAND, MULTIPLIER);
        Test.stopTest();

        System.assertEquals(expectedProduct, actualProduct, 'multiply() should return 12 for inputs 4 and 3');
    }

    /**
     * @description Verifies divide() returns correct quotient for valid inputs.
     */
    @isTest
    static void testDivideReturnsCorrectQuotient() {
        Decimal inputDividend    = 10;
        Decimal inputDivisor     = 2;
        Decimal expectedQuotient = 5;

        Test.startTest();
        Decimal actualQuotient = Calculator.divide(inputDividend, inputDivisor);
        Test.stopTest();

        System.assertEquals(expectedQuotient, actualQuotient, 'divide() should return 5 for inputs 10 and 2');
    }

    /**
     * @description Verifies divide() throws IllegalArgumentException when divisor is zero.
     */
    @isTest
    static void testDivideByZeroThrowsIllegalArgumentException() {
        Decimal inputDividend       = 10;
        Decimal inputDivisor        = 0;
        Boolean isExceptionThrown   = false;
        String  actualMessage       = '';
        String  expectedMessage     = 'Cannot divide by zero.';

        Test.startTest();
        try {
            Calculator.divide(inputDividend, inputDivisor);
        } catch (IllegalArgumentException thrownException) {
            isExceptionThrown = true;
            actualMessage     = thrownException.getMessage();
        }
        Test.stopTest();

        System.assert(isExceptionThrown, 'IllegalArgumentException should be thrown when divisor is zero');
        System.assertEquals(expectedMessage, actualMessage, 'Exception message should match expected value');
    }

    /**
     * @description Verifies add() returns correct result when adding negative numbers.
     */
    @isTest
    static void testAddWithNegativeNumbersReturnsCorrectSum() {
        Integer negativeAugend  = -4;
        Integer negativeAddend  = -6;
        Integer expectedSum     = -10;

        Test.startTest();
        Integer actualSum = Calculator.add(negativeAugend, negativeAddend);
        Test.stopTest();

        System.assertEquals(expectedSum, actualSum, 'add() should return -10 for inputs -4 and -6');
    }

    /**
     * @description Verifies multiply() returns zero when one operand is zero.
     */
    @isTest
    static void testMultiplyByZeroReturnsZero() {
        Integer zeroMultiplier  = 0;
        Integer expectedProduct = 0;

        Test.startTest();
        Integer actualProduct = Calculator.multiply(MULTIPLICAND, zeroMultiplier);
        Test.stopTest();

        System.assertEquals(expectedProduct, actualProduct, 'multiply() should return 0 when multiplier is 0');
    }
}