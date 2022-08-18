@RestResource(urlMapping='/v1/Students/*')
global class StudentControllerREST {
 // GET request
    @HttpGet
    global static List<Student__c> getWidgets() {
        List<Student__c> widgets = [SELECT Id, Name,Student_Name__c from Student__c];
        return widgets;
    }
    
    // POST request to create the Student into System
    @HttpPost 
    global static String createNewWidget(String name, string email) {
        Student__c student = new Student__c();
        student.Student_Name__c = name;
        student.Student_Email__c = email;
        insert student;
        String returnMesasge = 'You have successfully created a Student into Salesforce - '+'Record Id of the record is - '+student.id;
        return returnMesasge;
        //[Select Id, Name, Student_Name__c,Owner.Name From Student__c Where Id=:student.id];
   }

    // Delete to delete the given Student
    @HttpDelete
    global static String deleteWidgetById() {
        String Id = RestContext.request.params.get('Id');
        List<Student__c> w = [ Select ID from Student__c where Id= :Id];

        delete w;

        return 'Deleted Student';
    }

    // Update the Student Record
    @HttpPut
    global static String updateWidget(String Id, String NewName) {
        Student__c stnd = [ Select ID, Name,Student_Name__c from Student__c where Id= :Id];

        stnd.Student_Name__c = NewName;
        update stnd;

        return 'Widget Student';
    }
}