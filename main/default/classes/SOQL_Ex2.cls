public class SOQL_Ex2 {
    public String accountName {get;set;}
    public String industry {get;set;}
    public List<Account> accounts {get;set;}
    
    public void search(){
        accounts = [Select Id, Name, Rating, Industry,Phone,Type,AccountNumber from Account Where name=:accountName AND industry=:industry];
    }
    
     public void callMe(){
        string query = 'Select Id, Name, Rating, Industry,Phone,Type,AccountNumber from Account';
         if(accountName != '' && industry != ''){
             query = query + ' where name =\''+accountName+'\'and industry=\''+industry+'\'';
         }
         else if(accountName != ''){
             query = query + ' where name =\''+accountName+'\'';
         }
           else if(industry != ''){
             query = query + ' where industry =\''+industry+'\'';
         }
        accounts = Database.query(query);
    }
}