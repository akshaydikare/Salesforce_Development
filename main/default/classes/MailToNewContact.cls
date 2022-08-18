global class MailToNewContact implements Database.Batchable<sObject>
{
    Map<id,contact> IdContactMapBatch=new Map<id,contact>();
    global MailToNewContact(Map<id,contact> IdContactMap){
        IdContactMapBatch=IdContactMap;
    }
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
        return Database.getQueryLocator([SELECT id,firstname,email from contact where id in:IdContactMapBatch.keySet()]);
    }
    global void execute(Database.BatchableContext BC, List<Contact> scope) {     
        for(Contact con : scope)
        {    
           Messaging.SingleEmailMessage email=new Messaging.SingleEmailMessage();
        System.debug(con.Email);
               email.setToAddresses(new string[] {con.email});
               email.setSubject('Welcome Mail');
               email.setPlainTextBody('Welcome!, Your Contact Is Created Successfully In Salesforce');
           Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
        }
    }
    global void finish(Database.BatchableContext BC)
    {
    }
}