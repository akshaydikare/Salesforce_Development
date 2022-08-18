global class AccountUpdateBatchJob implements Database.Batchable<sObject> 
{    
    global Database.QueryLocator start(Database.BatchableContext BC)     {
        String query = 'SELECT Id,Name FROM Account WHERE Industry = null';                
        return Database.getQueryLocator(query);     
    }    
    global void execute(Database.BatchableContext BC, List<Account> scope)     {        
        for(Account a : scope)        
        {            
            a.Name = a.Name + 'Updated'; 
            a.Industry = 'Media';        
        }        
        update scope;       
    }    
    global void finish(Database.BatchableContext BC) {    }
}