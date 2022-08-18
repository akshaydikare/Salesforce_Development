public class DML_Insert_1 {
    public string accName 	{set;get;}
    public string phone   	{set;get;}
    public string industry	{set;get;}
    public string rating 	{set;get;}
    
    //pagereference is take because we cant go to page after specified action performed
    public PageReference create(){
        integer count= [Select Count() from Account where name=:accName]; 
        // this will gives count of same account name
        
        PageReference p;
        if(count>0){
            /* if the count is greater than zero, then duplicate records exists, 
throw error message and value p is null
*/
            ApexPages.Message msg= new ApexPages.Message(ApexPages.severity.Error,'Duplicate Record Exists');
            ApexPages.addMessage(msg);
        }else{
            //No duplicate reocrd exists then insert account and navigate to detail page of the record.
            Account acc=new Account();
            acc.name=accName;
            acc.phone=phone;
            acc.Industry= industry;
            acc.Rating=rating;
            insert acc;
            p=new PageReference('/'+acc.id);
        }
        return p;
    }
    
    public void cancel(){
        accName=null;
        phone=null;
        Industry=null;
        Rating=null;
        
    }
}