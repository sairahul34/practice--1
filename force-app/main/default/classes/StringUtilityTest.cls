@IsTest
private class StringUtilityTest {

    @IsTest
    static void testIsValidTextWithValidValue() {

        Boolean resultValue = StringUtility.isValidText(
            'Salesforce'
        );

        System.assertEquals(
            true,
            resultValue,
            'Expected valid text result.'
        );
    }

    @IsTest
    static void testIsValidTextWithBlankValue() {

        Boolean resultValue = StringUtility.isValidText(
            ''
        );

        System.assertEquals(
            false,
            resultValue,
            'Expected invalid result for blank text.'
        );
    }

    @IsTest
    static void testIsValidTextWithShortValue() {

        Boolean resultValue = StringUtility.isValidText(
            'ab'
        );

        System.assertEquals(
            false,
            resultValue,
            'Expected invalid result for short text.'
        );
    }

    @IsTest
    static void testConvertToTitleCaseWithValidInput() {

        String formattedText = StringUtility.convertToTitleCase(
            'hello world'
        );

        System.assertEquals(
            'Hello World',
            formattedText,
            'Expected title case output.'
        );
    }

    @IsTest
    static void testConvertToTitleCaseWithMixedCaseInput() {

        String formattedText = StringUtility.convertToTitleCase(
            'sALEsForCe apex'
        );

        System.assertEquals(
            'Salesforce Apex',
            formattedText,
            'Expected properly formatted title case.'
        );
    }

    @IsTest
    static void testConvertToTitleCaseWithBlankInput() {

        String formattedText = StringUtility.convertToTitleCase(
            ''
        );

        System.assertEquals(
            '',
            formattedText,
            'Expected empty string output.'
        );
    }
}