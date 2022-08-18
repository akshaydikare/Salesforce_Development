public class CL_LT_CreateAccount {
    @AuraEnabled
    Public Static String CreateAccount(String name, String rating, String phone, String industry){
        String result;
        try{
            Account A = new Account();
            A.Name = name;
            A.Phone = phone;
            A.Rating = rating;
            A.Industry = industry;
            Insert A;
            result = 'Account created successfully! & Id => ' + A.Id;
        }
        catch(exception ex){
             result = 'Account creation failed with error => '+ ex.getMessage();
        }
        return result;
    }
}