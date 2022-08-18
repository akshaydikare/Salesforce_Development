public class UpdateAccountRecordsBatchJob implements Database.Batchable<SObject>
{
	public Database.QueryLocator start(Database.BatchableContext bContext)
    {
        string accountsQuery = 'SELECT Id, Name, Rating, Industry, AnnualRevenue, Active__C FROM Account';
        return Database.getQueryLocator(accountsQuery);
    }
    
    public void execute(Database.BatchableContext bContext, List<SObject> recordsToProcess)
    {
        if (! recordsToProcess.isEmpty()) {	
            List<Account> accountsToUpdate = new List<Account>();
            for (SObject sobj : recordsToProcess) {
                Account accRecord = (Account) sObj;
                // Type Casting to convert SObject Type of Element into Account Type
                    accRecord.Rating = 'Hot';
                    accRecord.Industry = 'Manufacturing';
                    accRecord.AnnualRevenue= 7500000;
                    accRecord.Active__c = 'Yes';
                
                accountsToUpdate.add(accRecord);
            }
            
            if (! accountsToUpdate.isEmpty()) {
                Update AccountsToUpdate;
            }
        }
    }
    
    public void finish (Database.BatchableContext bContext)
    {
        AsyncApexJob jobDetails = [SELECT id, status, totalJobItems, jobItemsProcessed, 
                                   NumberofErrors, CreatedBy.Email
                                   FROM AsyncApexJob 
                                   Where id =:bContext.getJobId()];
        
        //Write the code to send the Email Notification.
        
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        	
        String[] toAddress = new String[]{jobDetails.CreatedBy.Email, 'abhinavpotdar1@gmail.com', 'akshaydikare@gmail.com'};
        email.setToAddresses(toAddress);
        
        email.setReplyTo('support@dell.com');
        
        email.setSenderDisplayName('DELL Weekly Batch Job Support Team');
        
        string emailSubject='Alert : Dell Weekly Batch Job : UpdateAccountRecordsBatchJob('+ bContext.getJobId()+') Status Notification';
        email.setSubject(emailSubject);
        
        string emailContent = 'Dear Customer Support, <br/><br/>'+'We are pleased to inform you, that Today Weekly Customer Update Batch Job has been Processed. <br/><br/>'+
                    					'Here are the Batch Job Details <br/><br/>'+ 
            							'Batch Job Id: ' + jobDetails.Id+
                    					'<br/> Batch Job Name: UpdateAccountRecordsBatchJob'+
                    					'<br/> Batch Job Status : '+ jobDetails.Status+
                    					'<br/> Total Number of Batches Available : '+ jobDetails.TotalJobItems+
                    					'<br/> Number of Batches Processed : '+ jobDetails.JobItemsProcessed+
                    					'<br/> Number of Batches Failed : '+ jobDetails.NumberOfErrors+
                     					'<br/><br/> Please Contact below DELL Support Team, if any queries. '+
                    					'<br/><br/> <i> * This is a System Generated Email. Please Do Not Reply.</i>'+
                    					'<br/><br/> Thanks & Regards, <br/> Customer Support Team, <br/> Dell Inc. ';
         email.setHtmlBody(emailContent);
         
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{email});
    }
}