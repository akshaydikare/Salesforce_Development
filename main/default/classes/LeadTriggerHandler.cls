public with sharing class LeadTriggerHandler {

public static void sendEmailOnLeadCreation(List<Lead> leadList){
    for(Lead lead : leadList){
        String mail = UserInfo.getUserEmail();
        Messaging.SingleEmailMessage msg=new Messaging.SingleEmailMessage(); 
        string[] options=new string[]{mail,lead.Email}; 
        msg.SetToAddresses(options);//we can not use more than one "setToAddresses"
        string body='dear customer';
        msg.setplaintextbody(body);
        msg.setsubject('test email');
        Messaging.Email[] emails=new Messaging.Email[]{msg};
        Messaging.sendEmail(emails);
    }
}   

public static void updatePhone(List<Lead> leadList){
    user u=[select name,Email from user where alias='apotd'];
    list<task> t1=new list<task>();
    for(Lead l : leadList){
            if(l.Industry=='banking'){
            l.Phone='8978130541';
            l.OwnerId=u.id;
            }
            task t=new task();
            t.subject='Take care of sfdc Task';
            t.OwnerId=u.id;
            t.WhoId=l.id;
            t.Priority='Normal';
            t.Status='Not-Started';
            // t1.add(t);
            insert t;
            messaging.SingleEmailMessage msg=new messaging.SingleEmailMessage();
            string[] email=new string[]{u.Email,l.Email};
            msg.setToAddresses(email);
            string body='dear customer';
            msg.setplaintextbody(body);
            msg.setsubject('Take care of sfdc Email');
            Messaging.Email[] emails=new Messaging.Email[]{msg};
            Messaging.sendEmail(emails);
            
            }
            }

        public static void AutoPopulateRevenue(List<Lead> lstLeads){
             if(!lstLeads.isEmpty()){
                for(Lead ldRecord : lstLeads)
                {
                    Switch ON ldRecord.Industry
                    {
                        When 'Banking'
                        {
                            ldRecord.AnnualRevenue = 9000000;
                        }
                        When 'Finance'
                        {
                            ldRecord.AnnualRevenue = 7600000;
                        }
                        When 'Insurance'
                        {
                            ldRecord.AnnualRevenue = 4500000;
                        }
                        When 'Manufacturing'
                        {
                            ldRecord.AnnualRevenue = 8400000;
                        }
                        When 'Consulting'
                        {
                            ldRecord.AnnualRevenue = 3200000;
                        }
                        When 'Education'
                        {
                            ldRecord.AnnualRevenue = 7400000;
                        }
                        When 'Energy'
                        {
                            ldRecord.AnnualRevenue = 9400000;
                        }
                    }
                }
             }
        }

 public static void CheckEmailDuplicationWithContact(list<Lead> leads,map<Id,Lead> MapLead)
    {
        map<String,Contact>  mapOfContact = new map<String, Contact>();
        list<Contact> con = [select id,email from contact];
        for (contact c:con) {
            mapofcontact.put(c.email,c);
        }
        for(lead l : leads) {
            if((l.email != null) && (l.email != MapLead.values().email)) {
                if(mapofContact.containsKey(l.email)){
                    l.Email.addError('Email already exists');
                }
            }               
        }
    }
    
    public static void LeadValidationExample(List<Lead> leadList){
        for(Lead l : leadList){
            if(l.LeadSource== 'Web' && l.Email == ''){
                l.addError('Email can not be blank when lead source is blank.');
            }
        }
    }

    }