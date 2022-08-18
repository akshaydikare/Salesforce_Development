public with sharing class AccountTriggerHandlerB4 {
    Public static void OnBeforeInsert(List<Account> lstnewAcc)
    {
        for(Account lstacc:lstnewAcc)
        {
            System.debug('Account Id:'+lstacc.Id+' ; '+'Account Name: '+lstacc.Name);
        }
    }
    Public Static void OnAfterInsert(List<Account> lstnewAcc, Map<Id, Account> Oldmap)
    {
        for(Account lstacc:lstnewAcc)
        {
            System.debug('Account Id:'+lstacc.Id+' ; '+'Account Name: '+lstacc.Name);
        }
    }
    Public static void OnBeforeUpdate(List<Account> lstnewAcc, Map<Id,Account> oldMap)
    {
        for(Account lstacc:lstnewAcc)
        {
            Account oldAcc=oldMap.get(lstacc.Id);
            System.debug('New Value: '+lstacc.Type+' ; '+'Old Value: '+oldAcc.Type);
        }
    }
    Public static void UpdateAccount(List<Account> lstnewAcc)
    {
        For(Account lstacc:lstnewAcc)
        {
            lstacc.Rating='Cold';
            lstacc.Industry='Banking';
        }
    }
    Public static void ValidateAccType(List<Account> lstnewAcc)
    {
        for(Account lstacc:lstnewAcc)
        {
            if((lstacc.Type=='Installation Partner' && lstacc.Ownership !='Private')||(lstacc.Type!='Installation Partner' && lstacc.Ownership =='Private'))
            lstacc.addError('Type must be Installation Partner when Ownership is Private');
        }
    }
    public static void CreateConforAcc(List<Account> lstnewAcc)
    {
        List<Contact> conlst=new List<Contact>();
        for(Account lstacc:lstnewAcc)
        {
            for(integer i=1;i<=2;i++)
            {
                contact objcon=new contact();
                objcon.FirstName=lstacc.Name+'-Contact'+i;
                objcon.LastName='test-'+i;
                objcon.AccountId=lstacc.Id;
                conlst.add(objcon);
            }
        }
        insert conlst;    
    }
     public static void deleteRelatedContact(Map<Id, Account> oldMap)
     {
       
        Set<Id> setOldAccIds = oldMap.keySet();
       
List<Contact> lstCon = [ SELECT Id FROM Contact WHERE AccountId IN : setOldAccIds ];
       
        if( lstCon != NULL && !lstCon.isEmpty())
        {
            delete lstCon;
        }
     }
}