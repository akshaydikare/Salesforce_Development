public class DMLExceptionCustom{
    
    public void showexception(Exception e)
    {
        system.debug('Exception type: '+e.getTypeName());
        system.debug('Line Number: '+e.getLineNumber());
        system.debug('Exception message: '+e.getMessage());       
    }
   /* public void Exceptionobject(Exception e)
    {
        Exception_Records_c obj=new Exception_Records_c();
        obj.Exception_type__c=e.getTypeName();
        obj.Exception_message__c=e.getMessage();
        obj.Line_Number__c=string.valueOf(e.getLineNumber());
        obj.Class_Name__c='DMLExceptionCustom';
        insert obj;
    }*/
    
    public void StudData(){
        try{
            Student__c stud = new Student__c();
            stud.Student_Name__c='CID-Abhi';
            //stud.Student_Name__c='Daya';
            stud.Description__c='04 number';
            stud.Student_Email__c='abhi@abhi.com';
            insert stud;
            
          Course__c csr1 =new Course__c();
            csr1.Name='Jr.KG';
            csr1.Course_Fees__c = 2000;
            csr1.Student__c	=stud.Id;
            insert csr1;
            
           Course__c csr2=new Course__c();
            csr2.Name='Craft';
            csr2.Course_Fees__c = 1000;
            csr2.Student__c	=stud.Id;
            insert csr2;
        }
        catch(exception e){
            //showException(e);
            // ExceptionObject(e);
            system.debug('Exception type: '+e.getTypeName());
            system.debug('Line Number: '+e.getLineNumber());
            system.debug('Exception message: '+e.getMessage());
        }
    }
}