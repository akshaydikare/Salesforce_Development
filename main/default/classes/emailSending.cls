public class emailSending {
    public string toMail { get; set;}
    public string ccMail { get; set;}
    public string repMail { get; set;}
    public string subMail { get; set;}
    public string bodyMail { get; set;}
    
    public void sendMail(){
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        string[] to = new string[] {toMail};
            string[] cc = new string[] {ccMail};
                
                email.setToAddresses(to);
        if(ccMail!=null && ccMail != '')
            email.setCcAddresses(cc);
        if(repmail!=null && repmail!= '')
            email.setInReplyTo(repMail);
        
        email.setSubject(subMail);
        
        email.setHtmlBody(bodyMail);
        try{
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { email });
        }catch(exception e){
            apexpages.addmessage(new apexpages.message(apexpages.severity.error,e.getMessage()));
        }
        
        toMail = '';
        ccMail = '';
        repMail = '';
        subMail ='';
        bodyMail = '';
    }
}