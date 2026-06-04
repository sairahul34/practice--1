public with sharing class StringUtility {

    private static final Integer MINIMUM_LENGTH = 3;

    /**
     * Checks whether the provided text is valid.
     *
     * @param inputText Text to validate
     * @return TRUE if valid, otherwise FALSE
     */
    public static Boolean isValidText(String inputText) {

        if (String.isBlank(inputText)) {
            return false;
        }

        String trimmedText = inputText.trim();

        return trimmedText.length() >= MINIMUM_LENGTH;
    }

    /**
     * Converts input text to title case.
     *
     * @param inputText Original text
     * @return Title case formatted text
     */
    public static String convertToTitleCase(String inputText) {

        if (String.isBlank(inputText)) {
            return '';
        }

        List<String> wordList = inputText.toLowerCase().split(' ');
        List<String> formattedWords = new List<String>();

        for (String currentWord : wordList) {

            if (String.isBlank(currentWord)) {
                continue;
            }

            String formattedWord =
                currentWord.substring(0, 1).toUpperCase()
                + currentWord.substring(1);

            formattedWords.add(formattedWord);
        }

        return String.join(formattedWords, ' ');
    }
}