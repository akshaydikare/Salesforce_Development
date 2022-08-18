public class BatchAccRelationB4 implements Database.Batchable<sObject>, Database.stateful {
    
    Set<ID> setSuccessIds = new Set <ID>();
    Set<String> setFailureMsg = new Set<String>();
    public Database.QueryLocator start(Database.BatchableContext bContext)
    {
        string AccountQuery = 'SELECT id, Name, (SELECT id, name FROM Account_Relations__r)FROM Account';
        return Database.getQueryLocator(AccountQuery);
    }
    
    public void execute(Database.BatchableContext bContext, List<Account> lstAccounts)
    {
        List<Account_Relation__c> lstAccRelations = new List<Account_Relation__c>();
        if(!lstAccounts.isEmpty())
        {
            for(Account acc: lstAccounts)
            {
                if(acc.Account_Relations__r.isEmpty())
                {
                    Account_Relation__c objRel = new Account_Relation__c();
                    objRel.Account__c = acc.Id;
                    objRel.Relation_Type__c = 'Supervisor';
                    objRel.Name = acc.Name+ '-Relation';
                    lstAccRelations.add(objRel);
                }
            }
            if( !lstAccRelations.isEmpty()){
                List<Database.SaveResult> lstSaveResults= database.insert(lstAccRelations, false);
                
                for(Database.SaveResult result: lstSaveResults)
                {
                    if(result.isSuccess())
                    {
                        setSuccessIds.add(result.getId());
                    }
                    else
                    {
                        for(Database.Error error: result.getErrors())
                        {
                            setFailureMsg.add(error.getMessage());
                        }
                    }
                }
            }
        }
    }
    public void finish(Database.BatchableContext bContext)
    {
        system.debug('Finish Success: '+setSuccessIds);
        system.debug('Finish failure:'+setFailureMsg);
        
        List<String> lstReceiversAddresses = new List<String>();
        lstReceiversAddresses.add('aksh.dikare5757@gmail.com');
        
        Messaging.SingleEmailMessage objSingleEmailMessage = new Messaging.SingleEmailMessage();
        
        objSingleEmailMessage.setToAddresses(lstReceiversAddresses);
        objSingleEmailMessage.setReplyTo('abhinavpotdar555@gmail.com');
        objSingleEmailMessage.setSubject('Account Relationship Batch Alert');
        objSingleEmailMessage.setSenderDisplayName('Abhinav Technology');
        objSingleEmailMessage.setBccSender(false);
        
        String htmlBody = '<h1> Relationship Batch Result </h1>';
        htmlBody = htmlBody + ' <p style="color: green;"> Success Ids :- </p> '; 
        htmlBody = htmlBody + '<p>' + String.join( (new List<Id>(setSuccessIds)) , ', ') + '</p> <hr>';
        htmlBody = htmlBody + ' <p style="color: red;"> Failure Messages :- </p> ';
        htmlBody = htmlBody + '<p>' + String.join( (new List<String>(setFailureMsg)) , ', ') + '</p> <hr>';
        
        objSingleEmailMessage.setHtmlBody(htmlBody);
        
        Messaging.sendEmail( new Messaging.SingleEmailMessage[] {objSingleEmailMessage} );
        
    }
}