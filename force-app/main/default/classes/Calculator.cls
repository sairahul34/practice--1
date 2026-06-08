/**
 * @description Utility class providing basic arithmetic operations.
 * This class cannot be instantiated.
 */
@SuppressWarnings('PMD.AvoidGlobalModifier')
public with sharing class Calculator {

    /**
     * @description Private constructor to prevent instantiation.
     */
    @SuppressWarnings('PMD.EmptyStatementBlock')
    private Calculator() {
        throw new UnsupportedOperationException('Calculator is a utility class and cannot be instantiated.');
    }

    /**
     * @description Adds two integers together.
     * @param firstNumber The first operand.
     * @param secondNumber The second operand.
     * @return Integer result of adding firstNumber and secondNumber.
     */
    public static Integer add(Integer firstNumber, Integer secondNumber) {
        return firstNumber + secondNumber;
    }

    /**
     * @description Subtracts secondNumber from firstNumber.
     * @param firstNumber The number to subtract from.
     * @param secondNumber The number to subtract.
     * @return Integer result of the subtraction.
     */
    public static Integer subtract(Integer firstNumber, Integer secondNumber) {
        return firstNumber - secondNumber;
    }

    /**
     * @description Multiplies two integers.
     * @param firstNumber The first operand.
     * @param secondNumber The second operand.
     * @return Integer result of the multiplication.
     */
    public static Integer multiply(Integer firstNumber, Integer secondNumber) {
        return firstNumber * secondNumber;
    }

    /**
     * @description Divides the dividend by the divisor.
     * @param dividend The number to be divided.
     * @param divisor The number to divide by. Must not be zero.
     * @return Decimal result of the division.
     * @throws IllegalArgumentException Thrown when divisor is zero.
     */
    public static Decimal divide(Decimal dividend, Decimal divisor) {
        if (divisor == 0) {
            throw new IllegalArgumentException('Cannot divide by zero.');
        }
        return dividend / divisor;
    }
}