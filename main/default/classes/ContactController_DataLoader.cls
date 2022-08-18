public with sharing class ContactController_DataLoader {
    @AuraEnabled
    public static List<Contact> getContacts() {
        List<Contact> contacts =
                [SELECT Id, Name, Phone, Email, Account.Name, Account.Industry FROM Contact ORDER BY Email NULLS LAST Limit 20];
        //Add isAccessible() check
        return contacts;
    }
}