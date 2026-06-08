/**
 * @description Utility class for basic arithmetic operations.
 */
public with sharing class Calculator {

    /**
     * @description Private constructor to prevent instantiation of utility class.
     */
    private Calculator() {
        // Utility class - no instantiation
    }

    /**
     * @description Adds two integers.
     * @param firstNumber The first integer.
     * @param secondNumber The second integer.
     * @return Sum of the two integers.
     */
    public static Integer add(Integer firstNumber, Integer secondNumber) {
        return firstNumber + secondNumber;
    }

    /**
     * @description Subtracts the second integer from the first.
     * @param firstNumber The first integer.
     * @param secondNumber The second integer.
     * @return Difference of the two integers.
     */
    public static Integer subtract(Integer firstNumber, Integer secondNumber) {
        return firstNumber - secondNumber;
    }

    /**
     * @description Multiplies two integers.
     * @param firstNumber The first integer.
     * @param secondNumber The second integer.
     * @return Product of the two integers.
     */
    public static Integer multiply(Integer firstNumber, Integer secondNumber) {
        return firstNumber * secondNumber;
    }

    /**
     * @description Divides the first decimal by the second.
     * @param dividend The number to be divided.
     * @param divisor The number to divide by.
     * @return Result of the division.
     * @throws IllegalArgumentException if divisor is zero.
     */
    public static Decimal divide(Decimal dividend, Decimal divisor) {
        if (divisor == 0) {
            throw new IllegalArgumentException('Cannot divide by zero.');
        }
        return dividend / divisor;
    }
}