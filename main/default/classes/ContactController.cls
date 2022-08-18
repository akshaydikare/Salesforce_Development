public with sharing class ContactController {
    @AuraEnabled(cacheable=true)
    public static Contact getSingleContact() {
        return [
            SELECT Id, FirstName,LastName, Title, Phone, Email
            FROM Contact
            WITH SECURITY_ENFORCED
            LIMIT 1
        ];
    }
}