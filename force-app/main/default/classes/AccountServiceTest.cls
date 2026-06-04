@isTest
private class AccountServiceTest {
    @isTest
    static void testContactCreation() {
        Account acc = new Account(Name = 'CloudTech');
        
        Test.startTest();
        insert acc; // Trigger logic usually calls the service, but we test the service directly here
        AccountService.createDefaultContact(new List<Account>{acc});
        Test.stopTest();
        
        List<Contact> results = [SELECT Id FROM Contact WHERE AccountId = :acc.Id];
        System.assertEquals(1, results.size(), 'A contact should have been created for the account.');
    }
}