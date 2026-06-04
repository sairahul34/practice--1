public class GradeChecker {

    public static String checkGrade(Integer marks) {

        if (marks >= 90) {
            return 'A';
        }
        else if (marks >= 75) {
            return 'B';
        }
        else if (marks >= 50) {
            return 'C';
        }
        else {
            return 'Fail';
        }
    }
}