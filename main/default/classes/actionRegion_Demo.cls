public class actionRegion_Demo {

    public Student__c studObject{get;set;}
    public string studNum{get;set;}
    
    public actionRegion_Demo(){
        studObject = new Student__c();
    }    
    
    public PageReference retrieveStudnetsRecords(){
        studObject = [Select Id,Student_Name__c,Student_Contact__c,Student_Email__c from Student__C where Name = :studNum];
        return null;
    }
}