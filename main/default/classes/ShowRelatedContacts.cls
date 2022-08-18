public class ShowRelatedContacts {
    public List<Contact> contactList {get; set;}
    public List<SelectOption> accountNames {get;set;}
    public string selectedAccount {get;set;}
   
    public ShowRelatedContacts(){
        contactList = new List<Contact>();
        accountNames = new List<SelectOption>();
        accountNames.add(new SelectOption('','--None--')); 
        for(Account accObj : [Select id, Name from Account limit 30]){
            accountNames.add(new SelectOption(accObj.id, accObj.Name));
        }
    }
    
    public pagereference retrieveContacts(){
        if(selectedAccount != ''){
            contactList = [Select Id, Name, email,Account.Name from contact where accountId = :selectedAccount];
        }
        
        return null;
    }
    
}