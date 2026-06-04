public with sharing class ContactDuplicateDetector {

    public class DuplicateGroup {
        @AuraEnabled
        public String email;

        @AuraEnabled
        public Integer duplicateCount;

        @AuraEnabled
        public List<Id> contactIds;

        public DuplicateGroup(String email, List<Id> contactIds) {
            this.email = email;
            this.contactIds = contactIds;
            this.duplicateCount = contactIds.size();
        }
    }

    public static List<DuplicateGroup> findDuplicates() {
        List<Contact> contacts = [
            SELECT Id, Email
            FROM Contact
            WHERE Email != null
            ORDER BY Email
        ];

        Map<String, List<Id>> emailMap = new Map<String, List<Id>>();

        for (Contact c : contacts) {
            if (!emailMap.containsKey(c.Email)) {
                emailMap.put(c.Email, new List<Id>());
            }
            emailMap.get(c.Email).add(c.Id);
        }

        List<DuplicateGroup> results = new List<DuplicateGroup>();

        for (String email : emailMap.keySet()) {
            if (emailMap.get(email).size() > 1) {
                results.add(
                    new DuplicateGroup(
                        email,
                        emailMap.get(email)
                    )
                );
            }
        }

        return results;
    }
}