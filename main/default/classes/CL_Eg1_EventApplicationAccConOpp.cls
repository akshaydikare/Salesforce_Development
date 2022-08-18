public class CL_Eg1_EventApplicationAccConOpp {
    @AuraEnabled
    public static string searchAccount(string accName, string accInd){
        string accId;
        List<Account> accounts = [Select Id, Name, Rating, Industry from account where Name=:accName and Industry=:accInd];
        
        if(accounts.size() == 0){
            accId='Error';
        }
        else{
            accId=accounts[0].Id;
        }
        return accId;
    }
    
    @AuraEnabled
    public static List<Contact> getContacts(string accId){
        List<Contact> cons = [Select id,FirstName, LastName, Email from Contact where AccountId =:accId];
        return cons;
    }
    
    @AuraEnabled
    public static List<Opportunity> getOpty(string accId){
        List<Opportunity> opty = [Select id,Name, StageName, Amount from Opportunity where AccountId =:accId];
        return opty;
    }
}