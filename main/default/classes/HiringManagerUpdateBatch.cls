public class HiringManagerUpdateBatch implements Database.Batchable<SObject>
{
  public Database.QueryLocator start(Database.BatchableContext bContext)
    {
        string hrRecordsQuery = 'Select id, name, location__C, contact_number__C, email_id__C from Hiring_Manager__C';
        return Database.getQueryLocator(hrRecordsQuery);
    }
    
    public void execute(Database.BatchableContext bContext, List<SObject> recordsToProcess)
    {
        if(!recordsToProcess.isEmpty())
        {
            List<Hiring_Manager__C> hrRecordsToUpdate = new List<Hiring_Manager__C>();
            List<ID> hrRecordsToDelete = new List<ID>();
            
            for(SObject obj : recordsToProcess)
            {
                Hiring_Manager__C hrRecord = (Hiring_Manager__C) obj;
                
                if(hrRecord.Email_ID__c != null)
                {
                  hrRecord.Location__c = 'Hyderabad';
                  hrRecord.Contact_Number__c = '5555888899';
                
                  hrRecordsToUpdate.Add(hrRecord);
                }
                else
                {
                   hrRecordsToDelete.Add(hrREcord.Id);
                }
                  
            }
            
            if(! hrRecordsToUpdate.isEmpty())
            {
                Update hrRecordsToUpdate;
            }
            
            if(! hrRecordsToDelete.isEmpty())
            {
                Database.delete(hrRecordsToDelete);
            }
        }
    }
    
    public void finish(Database.BatchableContext bContext)
    {
        System.debug('Batch Job Id is....: '+ bContext.getJobId());
        
        AsyncApexJob jobDetails = [Select id, status, totaljobItems, jobitemsprocessed, 
                                        numberoferrors, createdby.email
                                            from AsyncApexJob
                                                Where id =: bContext.getJobId()];
        
    MessagingUtilityHelper.sendBatchJobStatusNotifications(jobDetails,'HiringManagerUpdateBatch');        
    }
}