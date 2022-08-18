public class UpdateContactPhoneFromAccount {
    public static void UpdateContactPhoneFromAccount(){
        List<Contact> conList = [Select Id, FirstName, Phone,Account.Phone from Contact WHERE AccountId != null];

        if(!conList.isEmpty()){
            for (Contact con : conList) {
                if(con.Phone == null){
                    con.Phone = con.Account.Phone;
                }
            }
        }

        if(conList.size() > 0){
            Update conList;
        }
    }

}