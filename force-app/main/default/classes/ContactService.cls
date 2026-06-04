public with sharing class ContactService {

    private static final Integer MAX_RECORD_LIMIT = 200;

    /**
     * Updates phone numbers for Contacts belonging to an Account.
     *
     * @param accountId Account Id
     * @param newPhoneNumber New phone number value
     */
    public static void updateContactPhoneByAccount(
        Id accountId,
        String newPhoneNumber
    ) {
        validateInputs(accountId, newPhoneNumber);

        if (!Schema.sObjectType.Contact.isAccessible()
            || !Schema.sObjectType.Contact.fields.Phone.isUpdateable()) {
            throw new SecurityException(
                'User does not have permission to update Contact Phone.'
            );
        }

        List<Contact> contactsToUpdate = [
            SELECT Id, Phone
            FROM Contact
            WHERE AccountId = :accountId
            LIMIT :MAX_RECORD_LIMIT
        ];

        if (contactsToUpdate.isEmpty()) {
            return;
        }

        for (Contact currentContact : contactsToUpdate) {
            currentContact.Phone = newPhoneNumber;
        }

        update contactsToUpdate;
    }

    /**
     * Validates method inputs.
     */
    private static void validateInputs(
        Id accountId,
        String newPhoneNumber
    ) {
        if (accountId == null) {
            throw new IllegalArgumentException(
                'Account Id cannot be null.'
            );
        }

        if (String.isBlank(newPhoneNumber)) {
            throw new IllegalArgumentException(
                'Phone number cannot be blank.'
            );
        }
    }
}