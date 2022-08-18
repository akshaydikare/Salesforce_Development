public class AccountUtils {
    public static List<Account> accountsByState(String state){
      List<Account> accList  = [Select Id, Name from account where BillingState =:state];
        system.debug(accList);
        return accList;
    } 
}