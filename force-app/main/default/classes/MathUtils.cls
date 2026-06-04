/**
 * @description Utility class providing common mathematical operations
 *              including factorial, prime checking, and list summation.
 */
@SuppressWarnings('PMD.AvoidDebugStatements')
public with sharing class MathUtils {

    /**
     * @description Private constructor to prevent instantiation of utility class.
     */
    private MathUtils() {
        throw new UnsupportedOperationException('MathUtils is a utility class and cannot be instantiated.');
    }

    /**
     * @description Returns the factorial of a non-negative integer.
     * @param n The non-negative integer to compute factorial for.
     * @return Long The factorial result.
     * @throws IllegalArgumentException If the input is negative.
     */
    public static Long factorial(Integer n) {
        if (n == null) {
            throw new IllegalArgumentException('Input must not be null.');
        }
        if (n < 0) {
            throw new IllegalArgumentException('Input must be a non-negative integer.');
        }
        if (n == 0 || n == 1) {
            return 1L;
        }
        Long result = 1L;
        for (Integer i = 2; i <= n; i++) {
            result *= i;
        }
        return result;
    }

    /**
     * @description Checks whether a given integer is a prime number.
     * @param n The integer to check.
     * @return Boolean True if the number is prime, false otherwise.
     */
    public static Boolean isPrime(Integer n) {
        if (n == null) {
            return false;
        }
        if (n < 2) {
            return false;
        }
        Integer sqrtN = Integer.valueOf(Math.sqrt(n));
        for (Integer i = 2; i <= sqrtN; i++) {
            if (Math.mod(n, i) == 0) {
                return false;
            }
        }
        return true;
    }

    /**
     * @description Returns the sum of all integers in a given list.
     * @param numbers The list of integers to sum.
     * @return Integer The total sum, or 0 if the list is null or empty.
     */
    public static Integer sumList(List<Integer> numbers) {
        if (numbers == null || numbers.isEmpty()) {
            return 0;
        }
        Integer total = 0;
        for (Integer num : numbers) {
            if (num != null) {
                total += num;
            }
        }
        return total;
    }
}