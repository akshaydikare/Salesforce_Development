public class CL_DML_example_1 {
    public Account acc{set;get;}
    public List<Contact> contacts{set;get;}
    
    public CL_DML_example_1(){
        acc = new Account();
        contacts = new List<Contact>();
        add();
    }
    
    public void add(){
        Contact  c = new Contact();
        contacts.add(c);     
    }
    
    public PageReference Create(){
        insert acc;
        for(Contact c:contacts){
            c.AccountId =acc.Id;
        }
        insert contacts;
        PageReference page = new PageReference('/'+acc.id);
        return page;
    }
}