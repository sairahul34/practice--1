trigger ContactTrigger on Contact (
    before insert,
    before update
) {

    if (Trigger.isBefore) {

        if (Trigger.isInsert || Trigger.isUpdate) {

            ContactTriggerHandler.updateDepartment(
                Trigger.new
            );
        }
    }
}