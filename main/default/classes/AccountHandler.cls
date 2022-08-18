public class AccountHandler {
    public static void insertAccount(Integer value){
		List<Account> addAccounts = new List<Account>();
        
        Integer n = 1;

        while(n <= value){
            //display the current counter value
            System.debug('Counter Value before Incrementing ' + n);
            //create a new account
            Account store = new Account();
            store.Name = 'Dongkwang Inc New ' + n;
            store.AccountNumber = 'D000' + n;
             store.Rating = 'Hot';
            store.Industry = 'Manufacturing';
            store.Phone = '888888888'+n;
            addAccounts.add(store);
            System.debug(addAccounts);
            //increment the counter
            n = n + 1;
            System.debug('Counter Value after incrementing ' + n);
        }
         insert addAccounts;
    }
}