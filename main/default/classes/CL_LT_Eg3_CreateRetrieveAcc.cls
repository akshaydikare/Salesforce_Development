public class CL_LT_Eg3_CreateRetrieveAcc {
    @AuraEnabled
    public static String InsetAccount(Account acc){
        String result;
        try{
            Insert acc;
            result= acc.id; 
        }
        catch(exception ex){
            result= 'failed';
        }
        return result;
    }
    
    @AuraEnabled
    public static List<Account> getAccList(){
        List<Account> accounts = [Select Id, Name, Phone, Rating, Industry from Account];
        return accounts;
    }
}