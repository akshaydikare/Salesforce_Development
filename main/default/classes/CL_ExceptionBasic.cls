public class CL_ExceptionBasic {
    public static void throwException(){
        try{
            //Account acc = new Account();
            //insert acc; //DMLException
            //
            //List<Account> accList = [Select Name from Account];
            //string Rating = accList.Rating;    //sObjectException
            
            List<Account> accList = [Select Name from Account where name ='AAAAAAAA'];
            system.debug(accList); //QueryException
        }
        catch(exception ex){
            system.debug('1:'+ex.getMessage());
            system.debug('2:'+ex.getTypeName());
            system.debug('3:'+ex.getLineNumber());
        }
        
    }
}