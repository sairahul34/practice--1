/**
 * @description Test class for MathUtils covering factorial,
 *              prime checking, and list summation methods.
 */
@isTest
private class MathUtilsTest {

    /**
     * @description Tests that factorial of 0 returns 1.
     */
    @isTest
    static void testFactorialZero() {
        Test.startTest();
        Long result = MathUtils.factorial(0);
        Test.stopTest();
        System.assertEquals(1L, result, 'Factorial of 0 should be 1');
    }

    /**
     * @description Tests factorial for common positive integers.
     */
    @isTest
    static void testFactorialPositive() {
        Test.startTest();
        Long result5 = MathUtils.factorial(5);
        Long result1 = MathUtils.factorial(1);
        Long result3 = MathUtils.factorial(3);
        Test.stopTest();
        System.assertEquals(120L, result5, 'Factorial of 5 should be 120');
        System.assertEquals(1L,   result1, 'Factorial of 1 should be 1');
        System.assertEquals(6L,   result3, 'Factorial of 3 should be 6');
    }

    /**
     * @description Tests that factorial of a negative number throws IllegalArgumentException.
     */
    @isTest
    static void testFactorialNegativeThrowsException() {
        Test.startTest();
        Boolean exceptionThrown = false;
        String exceptionMessage = '';
        try {
            MathUtils.factorial(-1);
        } catch (IllegalArgumentException e) {
            exceptionThrown = true;
            exceptionMessage = e.getMessage();
        }
        Test.stopTest();
        System.assertEquals(true, exceptionThrown, 'Expected IllegalArgumentException was not thrown');
        System.assertEquals(true, exceptionMessage.contains('non-negative'), 'Unexpected error message: ' + exceptionMessage);
    }

    /**
     * @description Tests that factorial of null throws IllegalArgumentException.
     */
    @isTest
    static void testFactorialNullThrowsException() {
        Test.startTest();
        Boolean exceptionThrown = false;
        try {
            MathUtils.factorial(null);
        } catch (IllegalArgumentException e) {
            exceptionThrown = true;
        }
        Test.stopTest();
        System.assertEquals(true, exceptionThrown, 'Expected IllegalArgumentException for null input');
    }

    /**
     * @description Tests that known prime numbers are correctly identified.
     */
    @isTest
    static void testIsPrimePrimeNumbers() {
        Test.startTest();
        Boolean prime2  = MathUtils.isPrime(2);
        Boolean prime7  = MathUtils.isPrime(7);
        Boolean prime13 = MathUtils.isPrime(13);
        Test.stopTest();
        System.assertEquals(true, prime2,  '2 is prime');
        System.assertEquals(true, prime7,  '7 is prime');
        System.assertEquals(true, prime13, '13 is prime');
    }

    /**
     * @description Tests that non-prime numbers are correctly identified.
     */
    @isTest
    static void testIsPrimeNonPrimeNumbers() {
        Test.startTest();
        Boolean result1    = MathUtils.isPrime(1);
        Boolean result0    = MathUtils.isPrime(0);
        Boolean result9    = MathUtils.isPrime(9);
        Boolean resultNeg  = MathUtils.isPrime(-5);
        Boolean resultNull = MathUtils.isPrime(null);
        Test.stopTest();
        System.assertEquals(false, result1,    '1 is not prime');
        System.assertEquals(false, result0,    '0 is not prime');
        System.assertEquals(false, result9,    '9 is not prime');
        System.assertEquals(false, resultNeg,  'Negative is not prime');
        System.assertEquals(false, resultNull, 'Null is not prime');
    }

    /**
     * @description Tests sumList with a standard list of integers.
     */
    @isTest
    static void testSumListNormalList() {
        List<Integer> nums = new List<Integer>{1, 2, 3, 4, 5};
        Test.startTest();
        Integer result = MathUtils.sumList(nums);
        Test.stopTest();
        System.assertEquals(15, result, 'Sum should be 15');
    }

    /**
     * @description Tests sumList returns 0 for an empty list.
     */
    @isTest
    static void testSumListEmptyList() {
        Test.startTest();
        Integer result = MathUtils.sumList(new List<Integer>());
        Test.stopTest();
        System.assertEquals(0, result, 'Sum of empty list should be 0');
    }

    /**
     * @description Tests sumList returns 0 when null is passed.
     */
    @isTest
    static void testSumListNullList() {
        Test.startTest();
        Integer result = MathUtils.sumList(null);
        Test.stopTest();
        System.assertEquals(0, result, 'Sum of null should be 0');
    }

    /**
     * @description Tests sumList correctly ignores null elements inside the list.
     */
    @isTest
    static void testSumListWithNullElements() {
        List<Integer> nums = new List<Integer>{1, null, 3};
        Test.startTest();
        Integer result = MathUtils.sumList(nums);
        Test.stopTest();
        System.assertEquals(4, result, 'Sum should skip null elements and return 4');
    }
}