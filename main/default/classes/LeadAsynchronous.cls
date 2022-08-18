public class LeadAsynchronous {

    @future
    public static void updateLeadRecords(Set<Id> existingRecordIds){
        List<Lead> existingRecords = [SELECT Id, LeadSource FROM Lead WHERE Id IN :existingRecordIds];
        for(Lead record : existingRecords){
            record.LeadSource = 'Web';
            record.Email ='aksh.dikare5757@gmail.com';
        }
        update existingRecords;

        // calling another future method - NOT ALLOWED
        // createLeadRecords();
    }

	@future
    public static void createLeadRecords(){
        Lead anotherLead = new Lead(LastName='Test Lead Single 1', Status='Open - Not Contacted', Company='SFDCFacts', Industry='Banking', Email ='akshaydikare@gmail.com');
        insert anotherLead;
    }
}