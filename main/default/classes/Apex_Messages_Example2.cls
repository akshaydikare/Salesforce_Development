public class Apex_Messages_Example2 {
    public string name{set; get;}
    public Integer age{set; get;}
     public string gender{set; get;}
    public string city{set; get;}
   
        public void submit(){
              if(name == ''){
                    Apexpages.Message msg = new Apexpages.Message(Apexpages.Severity.ERROR, 'Name can not be blank');
                  Apexpages.addMessage(msg);
                }
             
               if(gender == '' && gender == null){
                     Apexpages.Message msg = new Apexpages.Message(Apexpages.Severity.ERROR, 'Gender can not be blank.');
                   Apexpages.addMessage(msg);
                }
             
               if(city == ''){
                     Apexpages.Message msg = new Apexpages.Message(Apexpages.Severity.ERROR, 'City can not be blank.');
                   Apexpages.addMessage(msg);
                }
             
               if(age < 30){
                     Apexpages.Message msg = new Apexpages.Message(Apexpages.Severity.ERROR, 'Age should be greater than 30.');
                   Apexpages.addMessage(msg);
                }
           }             
}