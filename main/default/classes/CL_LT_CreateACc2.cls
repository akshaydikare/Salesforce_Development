public class CL_LT_CreateACc2 {
	@AuraEnabled
    public Static String callAccount(Account acc){
        String result;
        try{
            insert acc;
            result = 'Account inserted succefully with Id: '+acc.Id;
        }
        catch(exception ex){
            result = ex.getMessage();
        }
        return result;
    }
}