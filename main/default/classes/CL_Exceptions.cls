public class CL_Exceptions {
    public static String CreateAccount(){
        String Result;
        try{
            Account acc = new Account();
            acc.Name = 'Adroit Accounts';
			insert acc;
            Result = 'Success With Id==> '+ acc.Id;
        } 
        catch(exception ex){
            Result = 'You dont have permission to access this method';
        }
        System.debug(Result);
	Return Result;
    }	
}