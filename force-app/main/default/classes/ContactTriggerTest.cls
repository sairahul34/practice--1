@isTest
private class ContactTriggerTest {

    @isTest
    static void testPersonalDepartment() {

        Contact con = new Contact(
            LastName = 'Test User',
            Email = 'demo@gmail.com'
        );

        insert con;

        Contact insertedCon = [
            SELECT Id, Department
            FROM Contact
            WHERE Id = :con.Id
        ];

        System.assertEquals(
            'Personal',
            insertedCon.Department
        );
    }

    @isTest
    static void testCorporateDepartment() {

        Contact con = new Contact(
            LastName = 'Corporate User',
            Email = 'employee@company.com'
        );

        insert con;

        Contact insertedCon = [
            SELECT Id, Department
            FROM Contact
            WHERE Id = :con.Id
        ];

        System.assertEquals(
            'Corporate',
            insertedCon.Department
        );
    }

    @isTest
    static void testOtherDepartment() {

        Contact con = new Contact(
            LastName = 'Other User',
            Email = 'abc@yahoo.com'
        );

        insert con;

        Contact insertedCon = [
            SELECT Id, Department
            FROM Contact
            WHERE Id = :con.Id
        ];

        System.assertEquals(
            'Other',
            insertedCon.Department
        );
    }

    @isTest
    static void testUpdateScenario() {

        Contact con = new Contact(
            LastName = 'Update User',
            Email = 'abc@yahoo.com'
        );

        insert con;

        con.Email = 'new@gmail.com';

        update con;

        Contact updatedCon = [
            SELECT Id, Department
            FROM Contact
            WHERE Id = :con.Id
        ];

        System.assertEquals(
            'Personal',
            updatedCon.Department
        );
    }
}