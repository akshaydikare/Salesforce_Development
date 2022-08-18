public class CL_1605_CreateRetrieveAccount {
@AuraEnabled
public static string InsertAccount(Account acc){
    String result;
    try 
    {
        Insert acc;
        result= acc.Id;
        } 
    catch (Exception e) {
        result = 'failed';
    }
    return result;
}

@AuraEnabled
public static List<Account> getAccountList(){  
    List<Account> accounts = [Select Id, Name, Rating, Industry, Phone from Account];
   return accounts;
}
}