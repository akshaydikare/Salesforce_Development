public class CL_LT_getAccList_DataTable {
	@AuraEnabled 
    public Static List<Account> getAccounts(String searchText){
		String query = 'Select id, name, phone,industry,rating from Account where name like\'%'+searchText+'%\'';
        
        List<Account> accounts = Database.query(query);
        system.debug(accounts);
        return accounts;
    }
}