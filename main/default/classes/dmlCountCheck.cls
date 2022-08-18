public class dmlCountCheck {
    public static void insertRecords()
    {
        // Prepare the Record.
        List<Account> lstAccounts= new List<Account>();
        for(integer counter=21; counter<=40; counter++)
        {
            Account acc= new Account();
            acc.name='Tesla '+counter;
            acc.Active__c='Yes';
            acc.Phone='087-234224';
            acc.Rating='Hot';
            acc.Industry='Engineering';
            acc.AnnualRevenue=12230000;
            acc.Website='www.tesla.com';
            acc.Ownership='Private';
            //acc.Status__c='Yes';
            
            // Add the record to the collection.
            lstAccounts.add(acc);
        }
        if(! lstAccounts.isEmpty())
        {
            insert lstAccounts;
        }
        
        system.debug('Number of DML Statements Used: '+Limits.getDmlStatements());
        system.debug('Number of DML Statements Limits: '+Limits.getLimitDmlStatements());
        system.debug('Number of DML Records Processed: '+Limits.getDmlRows());
        system.debug('Max. Number of DML Rows Limit: '+Limits.getLimitDmlRows());
        
    }
    
    
    public static void inserRecord(string industryName){
        //Dynamic SOQL is dynamic query creation
 		sObject s = [Select Name from Account];
    }
}