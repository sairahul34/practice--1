/**
 * @description Test class for LeadConverter.
 * Validates all CRUD and conversion operations on Lead records.
 */
@isTest
private class LeadConverterTest {

    private static final String TEST_FIRST_NAME     = 'Jane';
    private static final String TEST_LAST_NAME      = 'Smith';
    private static final String TEST_COMPANY        = 'Acme Corp';
    private static final String TEST_EMAIL          = 'jane.smith@acme.com';
    private static final String TEST_STATUS_OPEN    = 'Open - Not Contacted';
    private static final String TEST_STATUS_WORKING = 'Working - Contacted';

    /**
     * @description Builds and returns a test Lead record without inserting.
     * @return Lead A test Lead instance.
     */
    private static Lead buildTestLead() {
        Lead testLead      = new Lead();
        testLead.FirstName = TEST_FIRST_NAME;
        testLead.LastName  = TEST_LAST_NAME;
        testLead.Company   = TEST_COMPANY;
        testLead.Email     = TEST_EMAIL;
        testLead.Status    = TEST_STATUS_OPEN;
        return testLead;
    }

    /**
     * @description Verifies createLead() inserts a Lead and returns it with a valid Id.
     */
    @isTest
    static void testCreateLeadInsertsRecordSuccessfully() {
        Test.startTest();
        Lead createdLead = LeadConverter.createLead(
            TEST_FIRST_NAME,
            TEST_LAST_NAME,
            TEST_COMPANY,
            TEST_EMAIL
        );
        Test.stopTest();

        System.assertNotEquals(null, createdLead.Id, 'Created lead should have a valid Id');
        System.assertEquals(TEST_FIRST_NAME, createdLead.FirstName, 'First name should match input value');
        System.assertEquals(TEST_LAST_NAME, createdLead.LastName, 'Last name should match input value');
        System.assertEquals(TEST_COMPANY, createdLead.Company, 'Company should match input value');
        System.assertEquals(TEST_EMAIL, createdLead.Email, 'Email should match input value');
    }

    /**
     * @description Verifies getLeadById() retrieves the correct Lead record.
     */
    @isTest
    static void testGetLeadByIdReturnsCorrectRecord() {
        Lead insertedLead = buildTestLead();
        insert insertedLead;

        Test.startTest();
        Lead retrievedLead = LeadConverter.getLeadById(insertedLead.Id);
        Test.stopTest();

        System.assertEquals(insertedLead.Id, retrievedLead.Id, 'Retrieved lead Id should match inserted Id');
        System.assertEquals(TEST_COMPANY, retrievedLead.Company, 'Company name should match expected value');
    }

    /**
     * @description Verifies updateLeadStatus() correctly updates the lead status.
     */
    @isTest
    static void testUpdateLeadStatusUpdatesSuccessfully() {
        Lead insertedLead = buildTestLead();
        insert insertedLead;

        Test.startTest();
        LeadConverter.updateLeadStatus(insertedLead.Id, TEST_STATUS_WORKING);
        Test.stopTest();

        Lead refreshedLead = [
            SELECT Id, Status
            FROM Lead
            WHERE Id = :insertedLead.Id
            LIMIT 1
        ];

        System.assertEquals(TEST_STATUS_WORKING, refreshedLead.Status, 'Lead status should be updated to working');
    }

    /**
     * @description Verifies getLeadsByCompany() returns all leads matching the company name.
     */
    @isTest
    static void testGetLeadsByCompanyReturnsMatchingRecords() {
        List<Lead> leadsToInsert    = new List<Lead>();

        Lead firstLead              = new Lead();
        firstLead.FirstName         = 'Alice';
        firstLead.LastName          = 'Jones';
        firstLead.Company           = TEST_COMPANY;
        firstLead.Email             = 'alice.jones@acme.com';
        firstLead.Status            = TEST_STATUS_OPEN;
        leadsToInsert.add(firstLead);

        Lead secondLead             = new Lead();
        secondLead.FirstName        = 'Bob';
        secondLead.LastName         = 'Brown';
        secondLead.Company          = TEST_COMPANY;
        secondLead.Email            = 'bob.brown@acme.com';
        secondLead.Status           = TEST_STATUS_OPEN;
        leadsToInsert.add(secondLead);

        insert leadsToInsert;

        Test.startTest();
        List<Lead> retrievedLeads = LeadConverter.getLeadsByCompany(TEST_COMPANY);
        Test.stopTest();

        System.assertEquals(2, retrievedLeads.size(), 'Should retrieve exactly 2 leads for the company');
    }

    /**
     * @description Verifies convertLead() successfully converts a Lead into Account, Contact, and Opportunity.
     */
    @isTest
    static void testConvertLeadCreatesAccountContactAndOpportunity() {
        Lead insertedLead = buildTestLead();
        insert insertedLead;

        Test.startTest();
        Database.LeadConvertResult conversionResult = LeadConverter.convertLead(insertedLead.Id);
        Test.stopTest();

        System.assert(conversionResult.isSuccess(), 'Lead conversion should complete successfully');
        System.assertNotEquals(null, conversionResult.getAccountId(), 'Converted lead should have a linked Account Id');
        System.assertNotEquals(null, conversionResult.getContactId(), 'Converted lead should have a linked Contact Id');
        System.assertNotEquals(null, conversionResult.getOpportunityId(), 'Converted lead should have a linked Opportunity Id');
    }

    /**
     * @description Verifies deleteLead() removes the Lead record from the database.
     */
    @isTest
    static void testDeleteLeadRemovesRecordSuccessfully() {
        Lead insertedLead           = buildTestLead();
        insert insertedLead;

        Id insertedLeadId           = insertedLead.Id;
        Boolean isExceptionThrown   = false;

        Test.startTest();
        LeadConverter.deleteLead(insertedLeadId);
        Test.stopTest();

        try {
            Lead deletedLead = [
                SELECT Id
                FROM Lead
                WHERE Id = :insertedLeadId
                LIMIT 1
            ];
            System.assertEquals(null, deletedLead, 'Lead should not exist after deletion');
        } catch (QueryException thrownException) {
            isExceptionThrown = true;
        }

        System.assert(isExceptionThrown, 'QueryException should be thrown when querying a deleted lead');
    }

    /**
     * @description Verifies getLeadsByCompany() returns an empty list when no matches are found.
     */
    @isTest
    static void testGetLeadsByCompanyReturnsEmptyListWhenNoMatch() {
        String nonExistentCompany   = 'NonExistentCompanyXYZ';
        Integer expectedResultCount = 0;

        Test.startTest();
        List<Lead> retrievedLeads = LeadConverter.getLeadsByCompany(nonExistentCompany);
        Test.stopTest();

        System.assertEquals(expectedResultCount, retrievedLeads.size(), 'Should return empty list when no leads match the company');
    }
}