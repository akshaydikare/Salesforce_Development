public class Mixed_DML_Example {
   @future
    public static void callMe(){
        Account acc= new Account();
        acc.Name = 'Shruti Account';
        acc.Rating = 'Hot';
        acc.Industry='Banking';
        
        insert acc;
    }
    
    public static void ShowMe(){
        Profile pro = [Select Id, Name from Profile where Name = 'Dean'];
        UserRole role = [Select Id, Name from UserRole where Name = 'COO'];
        
        User u = new User();
        
        u.alias = 'sjagt';
        u.Email = 'shrutijagtap@gmail.com';
        u.LastName='Jagtap';
        u.ProfileId = pro.Id;
        u.UserRoleId = role.id;
        u.Username='shrutijagtap@shruti.com';
        u.LanguageLocaleKey='en_US';
        u.LocaleSidKey = 'en_US';
        u.TimeZoneSidKey='america/los_angeles';
        u.EmailEncodingKey = 'UTF-8';
        insert u;
    }
}