public class Mass_Delete_Account {
    public List<Account> accounts{get;set;}
    public Mass_Delete_Account(Apexpages.StandardSetController controller){
        string[] fields = new String[]{'Name', 'Rating', 'Phone', 'Industry'};
            controller.addFields(fields);
        accounts = (List<Account>)controller.getSelected();
        
    }
    
    public PageReference invoke(){
        Database.delete(accounts,false);
        Pagereference p = new PageReference('/001/o');
        return p;
    }
}