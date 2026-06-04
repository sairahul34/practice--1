trigger OpportunityTrigger on Opportunity (before delete) {
    for (Opportunity opp : Trigger.old) {
        if (opp.StageName == 'Closed Won') {
            opp.addError('You cannot delete a Closed Won Opportunity.');
        }
    }
}