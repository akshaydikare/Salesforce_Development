@isTest
private class UpdateAccountsTest {
    @isTest
    private static void testUpdateAccount(){
        Account acc = new Account();
        acc.Name = 'Test Account';
        acc.Active__c = 'No';
        acc.Rating = 'Warm';
        insert acc;
        
        Contact con = new Contact();
        con.FirstName = 'Test';
        con.LastName = 'Test';
        con.AccountId = acc.Id;
        insert con;
        
        UpdateAccounts.UpdateAccount();
        Account updatedAccout = [Select Id, Active__c, Rating from Account WHERE ID = :acc.Id];
        System.assertEquals('Hot', updatedAccout.Rating);
    }
}