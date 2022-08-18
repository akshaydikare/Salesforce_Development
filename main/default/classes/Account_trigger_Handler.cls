//USECASE: we can put only two contacts for an account.
public class Account_trigger_Handler {
    public static void beforeinsert(List<Contact> contacts){
        // Fetch those accounts for which new contacts are created using trigger.
        
        set<ID> accIds=new set<ID>();
        // take one by one new contact from list and add their corresponding accountID to the set
        
        for(Contact c:contacts){
            if(c.accountID!=Null){
                accIds.add(c.accountID);
            }
        }
        
        // Fetch accounts with corresponding contacts of those whose account ids are in accIds List write parent-Child SOQL Querry
        List <account> accounts =[select id, name,(select id from contacts) from Account where id in: accIds];
        
        // create a map with AccoundID as key and no. of Contacts for the Account as Value.
        
        Map<Id,Integer> accMap=new Map<Id,Integer>();
        for(Account a:accounts){
            list<contact> cons=a.contacts; //List of Contacts associated with Account.
            accMap.put(a.id,cons.size()); // a.id: accountID, Cons.size: count of no. of contacts
        }
        
        // take one by one new contacts which we are creating 
        For (contact x:contacts){
            // fetch the parent accountID.
            ID parentId=x.AccountID;
            if(parentId !=null){
                //get the count of no. of contacts Associated with Account.
                
                integer count=accMap.get(parentId);
                if(count>=2){
                    x.addError('Cannot Create more than two contacts for Account');
                }
            }
        }
    }
}