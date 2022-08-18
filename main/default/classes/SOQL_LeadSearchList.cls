public class SOQL_LeadSearchList {
    public String leadPhone {get;set;}
    public String leadEmail {get;set;}
    public List<Lead> leads {get;set;}
    
    public void searchLeads(){
        leads = [Select LastName, FirstName, Phone, Email from Lead Where email=:leadEmail AND phone=:leadPhone];
    }
    
     public void dynamicLeads(){
        string query = 'Select LastName, FirstName, Phone, Email from Lead';
         if(leadPhone != '' && leadEmail != ''){
             query = query + ' where email =\''+leadEmail+'\'and phone=\''+leadPhone+'\'';
         }
         else if(leadPhone != ''){
             query = query + ' where phone =\''+leadPhone+'\'';
         }
           else if(leadEmail != ''){
             query = query + ' where email =\''+leadEmail+'\'';
         }
        leads = Database.query(query);
    }
}