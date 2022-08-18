@isTest
private class CommonTestSetup 
{
    @testSetup 
    static void setup() 
    {
        Account acct = new Account();
        acct.Name = 'Salesforce.com';
        acct.Industry = 'Technology';
        insert acct;
        
        Contact cont = new Contact();
        cont.FirstName = 'Amit';
        cont.LastName = 'Chaudhary';
        cont.AccountId = acct.Id;
        insert cont;
    }
    
    @isTest 
    static void testMethod1() 
    {
        Account acct = [SELECT Id FROM Account WHERE Name='Salesforce.com' LIMIT 1];
        acct.Phone = '555-1212';
        update acct;
    }
    
    @isTest 
    static void testMethod2() 
    {
        Account acct = [SELECT Phone FROM Account WHERE Name='Salesforce.com' LIMIT 1];
        System.assertEquals(null, acct.Phone);
    }
}