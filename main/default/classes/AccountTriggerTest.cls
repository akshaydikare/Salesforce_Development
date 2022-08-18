@isTest
public class AccountTriggerTest {
    @isTest static void TestInsertRecords(){
         List<Account> accts = new List<Account>();
        for(Integer i=0; i < 200; i++) {
            Account acct = new Account(Name='Test Firse' + i,BillingState='CA');
            accts.add(acct);
        }              
        // Perform Test
        Test.startTest();
        insert accts;                               
        Test.stopTest();
        // Verify that 200 new Accounts were inserted
        List<Account> tstAccounts = [SELECT Id, ShippingState FROM Account Where Name like 'Test Firse'];
        for(Account tst : tstAccounts){
            System.assertEquals('CA', tst.ShippingState);  
        }
          

    }
}