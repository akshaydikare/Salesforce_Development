@isTest
public class HiringManagerUpdateBatchTest 
{
	@isTest Static void testHiringManagerBatch()
    {
        CreateHiringManagerRecords();

        // Test the Batch Class
        Test.startTest();

            HiringManagerUpdateBatch hrBatch = new HiringManagerUpdateBatch();
            Database.executeBatch(hrBatch);

        Test.stopTest();
    }
    
    //Method for test data preparation
    Public static void createHiringManagerRecords()
    {
        List<Hiring_Manager__c> lstHrRecords = new List<Hiring_Manager__c>();
        for(integer counter = 1; counter<+ 100; Counter++)
        {
            Hiring_Manager__c hr= new Hiring_Manager__c();
            hr.name= 'Test - '+counter;
            hr.Location__c='Mumbai';
            hr.Email_ID__c='testhr'+counter+'@gmail.com';
            hr.Contact_Number__c='9988664433';
            lstHrRecords.add(hr);
        }
        
        if(! lstHrRecords.isEmpty())
        {
            insert lstHrRecords;
        }
    }
}