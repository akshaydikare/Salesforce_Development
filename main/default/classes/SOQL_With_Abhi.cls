public class SOQL_With_Abhi { 
      
    public static List<Contact> ContactList(){
        List<Contact> con = [SELECT FirstName, LastName FROM Contact Order By FirstName];
        for(Contact c : con){
            system.debug(c);
        }
        return con;
    }
    
}