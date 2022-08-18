@isTest
private class copyBillingToShippingTest {
    @TestSetup
    private static void setup() //insert trigger will automatically fires with testsetup insert.
    {
        List<Account> accList = new List<Account>();
        for(integer i =1; i <= 3; i++){
            Account acc = new Account();
            acc.Name = 'Test'+i;
            acc.BillingCity='Mumbai';
            acc.BillingCountry = 'IND';
            acc.BillingState = 'Maharashtra';
            acc.BillingStreet='TestStreet';
            acc.BillingPostalCode = '413213';
            if(1==1){
                acc.CopyBillingShipping__c = true;
            }
            
            
            accList.add(acc);
        }
        //     Test.startTest();
        insert accList;
        //    Test.stopTest();
        //    Account shippingAcc = [Select ShippingCity from Account WHERE Id =:accList[0].Id];
        //   System.assertEquals('Mumbai', shippingAcc.ShippingCity);
    }
    
    @isTest
    private static void copyBillingToShippingTestUpdate()
    {
        
        Account acc = [Select Id, BillingCity, CopyBillingShipping__c from Account WHERE Name='Test2' LIMIT 1];
        Test.startTest();
        acc.CopyBillingShipping__c = true;
        update acc;
        Test.stopTest();
        Account shippingAcc = [Select Id, ShippingCity from Account WHERE Id =:acc.Id];
        System.assertEquals(acc.BillingCity, shippingAcc.ShippingCity);
    }
}