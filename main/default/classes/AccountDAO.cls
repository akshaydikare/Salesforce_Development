public class AccountDAO {
    public static List<Account> getAccountById(Set<Id> setOfAccountId){
        return [SELECT Id, Name, Phone, BillingStreet, ShippingStreet, BillingPostalCode, BillingState, BillingCountry,AnnualRevenue  FROM Account WHERE Id in :setOfAccountId];
    }
    
    public static List<Account> getAllAccount(){
        return [SELECT Id, Name, Phone, BillingStreet, ShippingStreet, BillingPostalCode, BillingState,AnnualRevenue, BillingCountry FROM Account];
    }
    
    public static void insertAccountDetails(List<Account> accountList){
        insert accountList;
    }
    
   /* public static List<Account> childAccounts(String keyword, List<Id> parentAccountIds){
        String searchKey = '%' +keyword + '%';
        return [SELECT ParentId__c, ParentId__r.Name, ParentId__r.RDG_Number__c, ParentId__r.Bill_Address__c,
                ParentId__r.OwnerId FROM Account where ParentId__r.Name like :searchKey and Id in :parentAccountIds];
    }*/
    
    public static List<Account> getAllDealer(String searchString){
        searchString = searchString+'%';
        return [SELECT Id, Name
                FROM Account
                WHERE Name LIKE :searchString];
    }
    
}