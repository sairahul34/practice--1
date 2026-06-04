public class ContactTriggerHandler {

    public static void updateDepartment(
        List<Contact> contactList
    ) {

        for (Contact con : contactList) {

            if (con.Email != null) {

                if (con.Email.contains('@gmail.com')) {

                    con.Department = 'Personal';
                }
                else if (
                    con.Email.contains('@company.com')
                ) {

                    con.Department = 'Corporate';
                }
                else {

                    con.Department = 'Other';
                }
            }
        }
    }
}