@IsTest
private class ContactServiceTest {

    private static final String UPDATED_PHONE = '9876543210';

    @TestSetup
    static void setupTestData() {

        Account testAccount = new Account(
            Name = 'Sample Account'
        );

        insert testAccount;

        List<Contact> contactList = new List<Contact>();

        for (Integer indexValue = 0; indexValue < 3; indexValue++) {

            contactList.add(
                new Contact(
                    FirstName = 'Test',
                    LastName = 'Contact ' + indexValue,
                    Phone = '1111111111',
                    AccountId = testAccount.Id
                )
            );
        }

        insert contactList;
    }

    @IsTest
    static void testUpdateContactPhoneByAccount() {

        Account existingAccount = [
            SELECT Id
            FROM Account
            LIMIT 1
        ];

        Test.startTest();

        ContactService.updateContactPhoneByAccount(
            existingAccount.Id,
            UPDATED_PHONE
        );

        Test.stopTest();

        List<Contact> updatedContacts = [
            SELECT Id, Phone
            FROM Contact
            WHERE AccountId = :existingAccount.Id
        ];

        System.assertEquals(
            3,
            updatedContacts.size(),
            'Expected three contacts.'
        );

        for (Contact currentContact : updatedContacts) {

            System.assertEquals(
                UPDATED_PHONE,
                currentContact.Phone,
                'Phone number should be updated.'
            );
        }
    }

    @IsTest
    static void testUpdateContactPhoneByAccountWithNullAccountId() {

        Boolean exceptionThrown = false;

        try {

            ContactService.updateContactPhoneByAccount(
                null,
                UPDATED_PHONE
            );

        } catch (IllegalArgumentException exceptionInstance) {

            exceptionThrown = true;
        }

        System.assertEquals(
            true,
            exceptionThrown,
            'Expected exception for null Account Id.'
        );
    }

    @IsTest
    static void testUpdateContactPhoneByAccountWithBlankPhone() {

        Account existingAccount = [
            SELECT Id
            FROM Account
            LIMIT 1
        ];

        Boolean exceptionThrown = false;

        try {

            ContactService.updateContactPhoneByAccount(
                existingAccount.Id,
                ''
            );

        } catch (IllegalArgumentException exceptionInstance) {

            exceptionThrown = true;
        }

        System.assertEquals(
            true,
            exceptionThrown,
            'Expected exception for blank phone number.'
        );
    }

    @IsTest
    static void testUpdateContactPhoneByAccountWithNoContacts() {

        Account emptyAccount = new Account(
            Name = 'Empty Account'
        );

        insert emptyAccount;

        Test.startTest();

        ContactService.updateContactPhoneByAccount(
            emptyAccount.Id,
            UPDATED_PHONE
        );

        Test.stopTest();

        List<Contact> contacts = [
            SELECT Id
            FROM Contact
            WHERE AccountId = :emptyAccount.Id
        ];

        System.assertEquals(
            0,
            contacts.size(),
            'No contacts should exist.'
        );
    }
}