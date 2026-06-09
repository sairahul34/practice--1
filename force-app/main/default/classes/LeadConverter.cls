/**
 * @description Service class for managing Lead records.
 * Provides methods to create, retrieve, update, and convert leads.
 */
public with sharing class LeadConverter {

    /**
     * @description Private constructor to prevent instantiation of utility class.
     */
    private LeadConverter() {
        throw new UnsupportedOperationException('LeadConverter is a utility class and cannot be instantiated.');
    }

    /**
     * @description Creates and inserts a new Lead record.
     * @param firstName The first name of the lead.
     * @param lastName The last name of the lead.
     * @param company The company name of the lead.
     * @param email The email address of the lead.
     * @return Lead The newly created and inserted Lead record.
     */
    public static Lead createLead(String firstName, String lastName, String company, String email) {
        Lead newLead      = new Lead();
        newLead.FirstName = firstName;
        newLead.LastName  = lastName;
        newLead.Company   = company;
        newLead.Email     = email;
        newLead.Status    = 'Open - Not Contacted';

        insert newLead;
        return newLead;
    }

    /**
     * @description Retrieves a Lead record by its Id.
     * @param leadId The Id of the Lead to retrieve.
     * @return Lead The retrieved Lead record.
     */
    public static Lead getLeadById(Id leadId) {
        return [
            SELECT Id, FirstName, LastName, Email, Company, Status, IsConverted
            FROM Lead
            WHERE Id = :leadId
            WITH SECURITY_ENFORCED
            LIMIT 1
        ];
    }

    /**
     * @description Updates the status of an existing Lead record.
     * @param leadId The Id of the Lead to update.
     * @param updatedStatus The new status value to set.
     */
    public static void updateLeadStatus(Id leadId, String updatedStatus) {
        Lead existingLead  = new Lead(
            Id     = leadId,
            Status = updatedStatus
        );
        update existingLead;
    }

    /**
     * @description Retrieves all Leads belonging to a specific company.
     * @param companyName The company name to filter leads by.
     * @return List<Lead> A list of matching Lead records.
     */
    public static List<Lead> getLeadsByCompany(String companyName) {
        return [
            SELECT Id, FirstName, LastName, Email, Company, Status
            FROM Lead
            WHERE Company = :companyName
            WITH SECURITY_ENFORCED
            ORDER BY LastName ASC
        ];
    }

    /**
     * @description Converts a Lead record into an Account, Contact, and Opportunity.
     * @param leadId The Id of the Lead to convert.
     * @return Database.LeadConvertResult The result of the lead conversion.
     */
    public static Database.LeadConvertResult convertLead(Id leadId) {
        LeadStatus convertedStatus = [
            SELECT Id, MasterLabel
            FROM LeadStatus
            WHERE IsConverted = TRUE
            WITH SECURITY_ENFORCED
            LIMIT 1
        ];

        Database.LeadConvert leadConversion         = new Database.LeadConvert();
        leadConversion.setLeadId(leadId);
        leadConversion.setConvertedStatus(convertedStatus.MasterLabel);
        leadConversion.setDoNotCreateOpportunity(false);

        List<Database.LeadConvert> leadConversionList       = new List<Database.LeadConvert>{ leadConversion };
        List<Database.LeadConvertResult> conversionResults  = Database.convertLead(leadConversionList);

        return conversionResults[0];
    }

    /**
     * @description Deletes a Lead record by its Id.
     * @param leadId The Id of the Lead to delete.
     */
    public static void deleteLead(Id leadId) {
        Lead leadToDelete = new Lead(Id = leadId);
        delete leadToDelete;
    }
}