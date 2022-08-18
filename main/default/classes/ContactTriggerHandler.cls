public class ContactTriggerHandler {

public static void checkAccount(List<Contact> contactList){
for (Contact con : contactList) {
    if(con.AccountId == null){
        con.AccountId.addError('Please add account');
    }
}
}

public static void updateAccountsPhone(List<Contact> contactList){
    List<account> acc =[select name,phone,id,(select id,otherphone,accountid from contacts where id 
    in:contactList) from account];
    system.debug(acc);
        for(Account a:acc){
            for(contact c:a.Contacts){
                if(c.accountid==a.id){
                    c.OtherPhone=a.phone;
                    update c;
                }
            }
        }
    }
}