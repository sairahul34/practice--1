/**
 * @description Utility class providing basic arithmetic operations.
 */
public with sharing class Calculator {

    /**
     * @description Private constructor to prevent instantiation of utility class.
     */
    private Calculator() {
        throw new UnsupportedOperationException('Calculator is a utility class and cannot be instantiated.');
    }

    /**
     * @description Adds two integers together.
     * @param augend The first operand to add.
     * @param addend The second operand to add.
     * @return Integer sum of augend and addend.
     */
    public static Integer add(Integer augend, Integer addend) {
        return augend + addend;
    }

    /**
     * @description Subtracts the subtrahend from the minuend.
     * @param minuend The number to subtract from.
     * @param subtrahend The number to subtract.
     * @return Integer result of the subtraction.
     */
    public static Integer subtract(Integer minuend, Integer subtrahend) {
        return minuend - subtrahend;
    }

    /**
     * @description Multiplies two integers together.
     * @param multiplicand The first operand.
     * @param multiplier The second operand.
     * @return Integer product of multiplicand and multiplier.
     */
    public static Integer multiply(Integer multiplicand, Integer multiplier) {
        return multiplicand * multiplier;
    }

    /**
     * @description Divides the dividend by the divisor.
     * @param dividend The number to be divided.
     * @param divisor The number to divide by. Must not be zero.
     * @return Decimal result of the division.
     * @throws IllegalArgumentException When divisor is zero.
     */
    public static Decimal divide(Decimal dividend, Decimal divisor) {
        if (divisor == 0) {
            throw new IllegalArgumentException('Cannot divide by zero.');
        }
        return dividend / divisor;
    }
}