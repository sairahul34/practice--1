@isTest
private class OpportunityTriggerTest {
    @isTest
    static void testDeleteRestriction() {
        // 1. Setup Data
        Opportunity opp = new Opportunity(
            Name = 'Test Opp',
            StageName = 'Closed Won',
            CloseDate = Date.today().addDays(10)
        );
        insert opp;

        // 2. Execute Test
        Test.startTest();
        Database.DeleteResult result = Database.delete(opp.Id, false);
        Test.stopTest();

        // 3. Verify Results
        System.assert(!result.isSuccess(), 'The deletion should have failed.');
        System.assertEquals('You cannot delete a Closed Won Opportunity.', result.getErrors()[0].getMessage());
    }
}