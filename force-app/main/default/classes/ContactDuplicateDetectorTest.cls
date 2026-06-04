@IsTest
private class ContactDuplicateDetectorTest {

    @IsTest
    static void testFindDuplicates() {

        List<Contact> contacts = new List<Contact>{
            new Contact(
                LastName = 'Smith',
                Email = 'duplicate@test.com'
            ),
            new Contact(
                LastName = 'Johnson',
                Email = 'duplicate@test.com'
            ),
            new Contact(
                LastName = 'Brown',
                Email = 'unique@test.com'
            )
        };

        insert contacts;

        Test.startTest();
        List<ContactDuplicateDetector.DuplicateGroup> results =
            ContactDuplicateDetector.findDuplicates();
        Test.stopTest();

        System.assertEquals(
            1,
            results.size(),
            'One duplicate email group should be found'
        );

        System.assertEquals(
            'duplicate@test.com',
            results[0].email
        );

        System.assertEquals(
            2,
            results[0].duplicateCount
        );

        System.assertEquals(
            2,
            results[0].contactIds.size()
        );
    }

    @IsTest
    static void testNoDuplicates() {

        insert new List<Contact>{
            new Contact(
                LastName = 'Alpha',
                Email = 'alpha@test.com'
            ),
            new Contact(
                LastName = 'Beta',
                Email = 'beta@test.com'
            )
        };

        List<ContactDuplicateDetector.DuplicateGroup> results =
            ContactDuplicateDetector.findDuplicates();

        System.assertEquals(
            0,
            results.size(),
            'No duplicate groups should exist'
        );
    }
}