public class FetchContacts {
	@AuraEnabled
    public static List<contact> conList(String accountId){
        return [Select Id, Name, Email, Phone from Contact where AccountId = :accountId order by Email Nulls Last];
    }
    
    
    @AuraEnabled
    public static Contact createContact(Contact con, Id accountId){
        con.AccountId = accountId;
        
        insert con;
        return con;
    }
}