public class UpdateAccounts {
    public static void UpdateAccount(){
        List<Account> accToBeUpdated = new List<Account>();
        Set<Id> accIdSet =new Set<Id>();
        
        for(Contact con : [Select Id, Account.ID from Contact 
                           WHERE Name LIKE '%Test%' AND Account.Id != null]){
                               if(!accIdSet.contains(con.Account.Id)){
                                   Account acc = new Account();
                                   acc.Id = con.Account.Id;
                                   acc.Active__c = 'Yes';
                                   acc.Rating = 'Hot';
                                   accToBeUpdated.add(acc);
                                   accIdSet.add(con.Account.Id);
                               }                     
                           }
        if(!accToBeUpdated.isEmpty()){
            update accToBeUpdated;
        }
    }
}