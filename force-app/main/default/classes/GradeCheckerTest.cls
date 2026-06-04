@isTest
private class GradeCheckerTest {

    @isTest
    static void testGradeA() {

        String result = GradeChecker.checkGrade(95);

        System.assertEquals('A', result);
    }

    @isTest
    static void testGradeB() {

        String result = GradeChecker.checkGrade(80);

        System.assertEquals('B', result);
    }

    @isTest
    static void testGradeC() {

        String result = GradeChecker.checkGrade(55);

        System.assertEquals('C', result);
    }

    @isTest
    static void testFailGrade() {

        String result = GradeChecker.checkGrade(30);

        System.assertEquals('Fail', result);
    }
}