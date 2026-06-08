@isTest
private class CalculatorTest {

    @isTest
    static void testAdd() {
        Integer result = Calculator.add(5, 3);
        System.assertEquals(8, result, 'Addition failed');
    }

    @isTest
    static void testSubtract() {
        Integer result = Calculator.subtract(10, 4);
        System.assertEquals(6, result, 'Subtraction failed');
    }

    @isTest
    static void testMultiply() {
        Integer result = Calculator.multiply(4, 3);
        System.assertEquals(12, result, 'Multiplication failed');
    }

    @isTest
    static void testDivide() {
        Decimal result = Calculator.divide(10, 2);
        System.assertEquals(5, result, 'Division failed');
    }

    @isTest
    static void testDivideByZero() {
        try {
            Calculator.divide(10, 0);
            System.assert(false, 'Expected exception was not thrown');
        } catch (IllegalArgumentException e) {
            System.assertEquals('Cannot divide by zero.', e.getMessage());
        }
    }
}