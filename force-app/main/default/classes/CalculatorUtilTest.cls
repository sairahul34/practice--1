@isTest
private class CalculatorUtilTest {

    @isTest
    static void testAddNumbers() {

        Integer result = CalculatorUtil.addNumbers(10, 5);

        System.assertEquals(15, result);
    }

    @isTest
    static void testSubtractNumbers() {

        Integer result = CalculatorUtil.subtractNumbers(10, 5);

        System.assertEquals(5, result);
    }

    @isTest
    static void testMultiplyNumbers() {

        Integer result = CalculatorUtil.multiplyNumbers(4, 5);

        System.assertEquals(20, result);
    }

    @isTest
    static void testDivideNumbers() {

        Decimal result = CalculatorUtil.divideNumbers(20, 5);

        System.assertEquals(4, result);
    }

    @isTest
    static void testDivideByZero() {

        Decimal result = CalculatorUtil.divideNumbers(10, 0);

        System.assertEquals(0, result);
    }
}