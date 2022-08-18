public class Example_WithAbhinav {
    
    public static String CreateAccount(){
        String result;
        String result1;
        try{
            //List<Account> accList = [Select Id, Name, Phone, Rating from Account];
            Account newAcc = new Account();
            Insert newAcc;
            result='success';
        }
        catch(exception ex){
            result='Error: '+ex.getMessage();
        }
        finally{
            result1='code to be executed at any case';
        }
        system.debug(result);
        system.debug(result1);
        return result;
    }
    
    
    
    public static void division(integer num1, integer num2) {
        integer demoResult;
        
        try {
            demoResult = num1 / num2;
        } 
        catch (exception e) {
            system.debug('Exception caught: '+ e.getMessage());
        } 
        finally {
            system.debug('Result = '+ demoResult);
        }
    }
    
    
    public static void mapExample(){
        Map<Id, Account> accountMap = new Map<Id, Account>([SELECT Id, Name FROM Account]);
        Id accId = '0015j00000WFircAAD';
        Account account = accountMap.get(accId);
        system.debug(account);
    }
    
}