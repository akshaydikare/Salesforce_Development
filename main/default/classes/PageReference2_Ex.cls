public class PageReference2_Ex {
    public string name{set; get;}
    public Integer age{set; get;}
     public String city{set; get;}
        public PageReference submit(){
               if(age <= 0){
                   Apexpages.Message msg = new Apexpages.Message(Apexpages.Severity.ERROR, 'Age should be greater than 0.');
                   Apexpages.addMessage(msg);
                  PageReference p = new PageReference('/apex/PageReference2_Ex');
                   return p;
                }   
            else{
                  PageReference p = new PageReference('/apex/StudentData');
                   return p;
             }    
            }
                    
}