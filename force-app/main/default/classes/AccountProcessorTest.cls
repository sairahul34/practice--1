@isTest
private class AccountProcessorTest {

    @testSetup
    static void setup() {
        // Create sample data: one high revenue, one low revenue
        List<Account> testAccs = new List<Account>();
        
        testAccs.add(new Account(
            Name = 'High Rev Corp', 
            AnnualRevenue = 2000000
        ));
        
        testAccs.add(new Account(
            Name = 'Small Biz Inc', 
            AnnualRevenue = 50000
        ));
        
        insert testAccs;
    }

    @isTest
    static void testUpdateAccountPriority() {
        // Retrieve records created in setup
        List<Account> accs = [SELECT Id, AnnualRevenue, Description FROM Account];
        
        Test.startTest();
        AccountProcessor.updateAccountPriority(accs);
        Test.stopTest();
        
        // Verify High Revenue Account was updated
        Account highRev = [SELECT Description FROM Account WHERE Name = 'High Rev Corp' LIMIT 1];
        System.assertEquals('High Priority Account - Premium Support Required', highRev.Description, 
            'The description should have been updated for high revenue accounts.');
            
        // Verify Small Revenue Account was NOT updated
        Account lowRev = [SELECT Description FROM Account WHERE Name = 'Small Biz Inc' LIMIT 1];
        System.assert(String.isBlank(lowRev.Description), 
            'The description should remain empty for low revenue accounts.');
    }
}