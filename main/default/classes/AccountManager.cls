@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {
	@HttpGet
    global static Account getAccount(){
         RestRequest request = RestContext.request;
        String accountId = request.requestURI.substringBetween('Accounts/','/contacts');
        Account acc = [Select Id, Name, Rating, (Select Id, FirstName, LastName from contacts)
                       from Account
                       		where ID = :accountId];
        
        return acc;
    }
}