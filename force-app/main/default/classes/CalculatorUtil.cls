public class CalculatorUtil {

    public static Integer addNumbers(Integer a, Integer b) {
        return a + b;
    }

    public static Integer subtractNumbers(Integer a, Integer b) {
        return a - b;
    }

    public static Integer multiplyNumbers(Integer a, Integer b) {
        return a * b;
    }

    public static Decimal divideNumbers(Integer a, Integer b) {

        if (b == 0) {
            return 0;
        }

        return a / b;
    }
}