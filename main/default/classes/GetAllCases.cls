public with sharing class GetAllCases {
   //Select Id, CaseNumber, Origin,Reason,ClosedDate from Case
    @AuraEnabled(cacheable=true) //cacheable=true)
   public static List<Case> AllCasesList(String origin){
        List<Case> cases = [Select Id, CaseNumber, Origin,Reason,ClosedDate from Case Where Origin = :origin ORDER BY Reason DESC NULLS LAST LIMIT 10];       
        return cases;
       
   }

    @AuraEnabled
   public static List<Account> getAllAccounts(){
    List<Account> accounts = [Select Id, Name, Industry,Rating,AccountNumber from Account ORDER BY Industry DESC NULLS LAST LIMIT 10];       
        return accounts;
   }

   @AuraEnabled(cacheable=true)
   public static List<Contact> findContacts(String searchKey) {
       String key = '%' + searchKey + '%';
       return [
           SELECT Id, Name, Title, Phone, Email
           FROM Contact
           WHERE Name LIKE :key 
           WITH SECURITY_ENFORCED
           ORDER BY Email NULLS LAST
           LIMIT 10
       ];
   }

   @AuraEnabled(cacheable=true)
   public static List<Contact> getContactList() {
       return [
           SELECT Id, Name, Title, Phone, Email, Owner.Name
           FROM Contact
           WITH SECURITY_ENFORCED
           LIMIT 10
       ];
   }
}