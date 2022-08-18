public class AllAccounts {

    @AuraEnabled
    public static list<Account> getAllAccounts(){
        return [Select Id, Name, Industry, Rating, Phone from Account Limit 10];
    }
    
     @AuraEnabled
    public static Account getAccountDetails(String accountId){
        return [Select Id, Name, Industry, Rating, Phone from Account where ID= :accountId];
    }
}