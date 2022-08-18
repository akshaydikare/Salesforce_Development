public class DatabaseHelper_SOQL {

    public static void getAccountBySearchTxt(String startingChar){
        if(startingChar != null && startingChar != '') {
            startingChar += '%';
            
            List<Account> accList = [Select Id, Name, Rating, Industry, Phone, active__C 
                                     							from account 
                                     								where Name like :startingChar];
            
            for(Account acc : accList){
                system.debug('Accounts with '+startingChar+ 'are'+ acc);
            }
        }
    }
    
    public static void getRecordsCount(){
        //Static SOQL
        Integer countAccount = [Select Count() from Account];
        system.debug('Account recordsCount using Static Query : '+ countAccount);
        
        String countAccountQuery = 'Select Count() from Account';
        Integer countAccountDynamic = Database.countQuery(countAccountQuery);
        system.debug('Account recordsCount using Dynamic Query : '+ countAccountDynamic);
        
    }
    
    //Dynamic Query with params
    public static void getCasesByStatus(String status){
       String caseQuery = 'Select Id,Status, Origin,Reason,type,subject from CASE where status=:status';
       List<Case> cases = database.query(caseQuery);
        for(Case cs : cases){
            system.debug('Records By Status are: '+cs );
        }
        
    }
    
    //Write an SOQL query returning highest annual revenue Account
   public static void getAccountInSortedRevenue(){
        List<Account> accList = [Select Id, Name, Rating, Industry, AnnualRevenue, Phone from Account Order By annualrevenue desc NULLS LAST];
        for(Account acc : accList){
            system.debug('Sorted Accounts: '+acc);
        }
   }
    public static void getAccountInSortedOrder(){
        List<Account> accList = [Select Id, Name, Rating, Industry, AnnualRevenue, Phone from Account Order By Name];
        for(Account acc : accList){
            system.debug('Sorted Accounts: '+acc.Name);
        }
    }
    
    public static void getAccountRelationAllRows(){
         //List<Account> accList = [Select Id, Name, Rating, Industry, Phone,active__c from Account ALL ROWS];
        List<Account_Relation__c> accRelationList = [Select Id, Name, Account__c, Relation_Type__C from Account_Relation__c];
        System.debug('Collection Size: '+ accRelationList.size());
    }
    
    public static void getAccountsByLimit(){
        //Limit the fetching of reccords.
        List<Account> accList = [Select Id, Name, Rating, Industry, Phone,active__c from Account Limit 10];
        
        for(Account acc : accList){
            system.debug('Account Recs: '+acc);
        }
    }
    
    public static void getAllCasesMap(){
        //Salesforce do all operation to put all recs from query into Map.
        Map<Id,Case> mapcases = new Map<Id, Case>([Select Id,Status, Origin,Reason,type,subject from CASE]);
        
        for(Case cs : mapcases.values())
        {
            system.debug('Cases data is: '+ cs);
        }
        //Previously used like this
        /*Map<Id,Case> mapcases = new Map<Id, Case>();
       List<Case> cases = [Select Id,Status, Origin,Reason,type,subject from CASE];
        for(Case cs : cases){
            mapcases.put(cs.id, cs);
        }*/
    }
    
    public static void getAllContacts(){
        for(Contact con : [Select Id, Name, Email from Contact]){
            system.debug(con.Name);
        }
    }
}