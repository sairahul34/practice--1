public with sharing class AccountProcessor {
    
    /**
     * Updates the description of Accounts based on revenue.
     * Logic: If Revenue > 1,000,000, mark as 'High Priority'.
     */
    public static void updateAccountPriority(List<Account> accList) {
        if (accList == null || accList.isEmpty()) {
            return;
        }

        List<Account> toUpdate = new List<Account>();

        for (Account acc : accList) {
            if (acc.AnnualRevenue != null && acc.AnnualRevenue > 1000000) {
                acc.Description = 'High Priority Account - Premium Support Required';
                toUpdate.add(acc);
            }
        }
        
        // DML operation
        if (!toUpdate.isEmpty()) {
            update toUpdate;
        }
    }
}