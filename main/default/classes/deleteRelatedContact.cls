public class deleteRelatedContact {
    @InvocableMethod
    Public static void deleteRelatedContact(List<Id> accId)
    {
        List<Account> accList = new List<Account>();
        List<Contact> conList = new List<Contact>();
        
        accList = [SELECT id,(SELECT id from Contacts)
                   FROM account
                   WHERE Id = :accId];
        for(Account acc: accList)
        {
            conList = acc.Contacts;
        }
        if(!conList.isEmpty())
        {
            Delete conList;
        }
    }
}