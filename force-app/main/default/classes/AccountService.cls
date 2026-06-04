public with sharing class AccountService {
    public static void createDefaultContact(List<Account> accounts) {
        List<Contact> newContacts = new List<Contact>();
        for (Account acc : accounts) {
            newContacts.add(new Contact(
                FirstName = 'Primary',
                LastName = acc.Name,
                AccountId = acc.Id,
                Email = 'info@' + acc.Name.deleteWhitespace() + '.com'
            ));
        }
        if (!newContacts.isEmpty()) {
            insert newContacts;
        }
    }
}