public class SOQL_Ex1 {
    public List<Account> accounts {get;set;}
       public Integer activeAcc {get;set;}
       public Integer allAcc {get;set;}
    public SOQL_Ex1(){
        accounts = [Select Id, Name, Rating, Industry,Phone,AccountNumber,Type From Account where Name = 'GenePoint' Limit 25];
    }
    
    public void FetchAll(){
           accounts = [Select Id, Name, Rating, Industry,Phone,AccountNumber,Type From Account ALL ROWS];
        system.debug(accounts);
    }
      public void setLimit(){
          
          accounts = [Select Id, Name, Rating, Industry,Phone,AccountNumber,Type From Account Limit 4];
    }
         public void setDynamicLimit(){
          integer count = 7;
          accounts = [Select Id, Name, Rating, Industry,Phone,AccountNumber,Type From Account Limit :count];
    }
     public void setOffset(){
          
          accounts = [Select Id, Name, Rating, Industry,Phone,AccountNumber,Type From Account Offset 5];
    }
    
    /*public void CountActiveAccounts(){
          activeAcc = [Select COUNT() From Account];
    }
    public void CountAllAccounts(){
          allAcc = [Select COUNT() From Account ALL ROWS];
    }*/
}