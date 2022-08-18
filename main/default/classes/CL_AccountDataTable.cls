public class CL_AccountDataTable {
    public string accName{set;get;}
    public string accIndustry{set;get;}
    public List<Account> accounts{set;get;}
    
    public void search(){
        accounts=[select id, name, industry, phone, rating from Account where name=:accName OR industry =:accIndustry];
    }

}