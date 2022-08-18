public class AccountCls {
    public Account accountObj {get;set;}
    
    public AccountCls(){
        accountObj = new Account();
    }
    
    public PageReference SaveAccount(){
        system.debug(accountObj);
        insert accountObj;
        return new PageReference('/'+accountObj.Id);
    }
    
}