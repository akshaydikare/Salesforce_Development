public class AccountTriggerHandler {
    public static void CreateAccounts(List<Account> accList){
        for(Account acc : accList){
            if(acc.ShippingState != acc.BillingState){
                acc.ShippingState = acc.BillingState;
            }
        }
    }

    public static void TriggerAccountCreateOpty(List<Account> accList){
        list<opportunity> opty=new list<opportunity>();
        for(Account acc : accList){
           if(acc.Industry == 'Education' && acc.Rating == 'Warm'){
                Opportunity opp = new Opportunity();

                opp.Name = acc.Name;
                opp.Type='New Customer';
                opp.CloseDate=system.today()+15;
                opp.StageName='Prospecting';
                opty.add(opp);
               system.debug('All Ok! :'+ opp);
           }
        }
        insert(opty);
    }

    public static void ChangeAccountOwner(List<Account> accList){
        User u = [Select name from User where Alias = 'apotd'];
        for (Account acc : accList) {
            if(acc.Industry == 'Banking'){
                acc.OwnerId = u.Id;
            }
        }
    }
    public static void addInAccountTeamMember(List<Account> accList){
       
        List<AccountTeamMember> atmList = new List<AccountTeamMember>();
        User u = [Select name from User where Alias = 'apotd'];
        for (Account acc : accList) {
            if(acc.AnnualRevenue > 500000){
                AccountTeamMember atm = new AccountTeamMember();
                atm.AccountId = acc.Id;
                atm.UserId = u.Id;
                atm.AccountAccessLevel='All';
                atm.TeamMemberRole = 'Lead Qualifier';
                //AccountId,AccountAccessLevel,TeamMemberRole,UserId
                atmList.add(atm);
            }
            
        }
        if(!atmList.isEmpty()){
            insert atmList;
        }
    }
    
    public static void createTaskWhenProspectcAcount(List<Account> accountList){
        User u = [Select name, Id from User where Alias = 'apotd'];
        List<Task> taskList = new List<Task>();
        for(Account acc : accountList){
            if(acc.Type == 'Prospect'){
                Task t = new Task();
                t.whatid=acc.id;
                t.Priority='Normal';
                t.Status='Not Started';
                t.Subject='call to him with in 7 days';
                t.OwnerId=u.Id; //if u want assign to owner t.ownerid=a.id
                taskList.add(t);

                Messaging.SingleEmailMessage msg=new Messaging.SingleEmailMessage();
                string[] cc=new string[]{u.Email};
                msg.setToAddresses(cc);

                string body='dear' + u.Name +', <br/> New task is added for you because the New account has added with type as'+acc.Type + '<br/> Thanks and Regards, <br/>'+acc.Owner;
                msg.setHtmlBody(body);
                msg.setsubject('Account With Prospect Check');
                Messaging.Email[] emails=new Messaging.Email[]{msg};
                Messaging.sendEmail(emails);
            }
        }

        if(!taskList.isEmpty()){
            insert taskList;
        }
    }

    public static void updatePhonforOwnership(Map<ID, Account> oldAccount,Map<ID, Account> newAccount){
        for(Id key:newAccount.keySet()){
            Account oldAcc=oldAccount.get(key);
            account newAcc=newAccount.get(key);
            if(oldAcc.ownership=='public' && newAcc.Ownership=='private'){
                newAcc.Phone='8216821616';
            }           
        }
    }

    public static void updateContactPhones(Map<ID, Account> oldAccount,Map<ID, Account> newAccount){
        list<account> acc=[select name,phone,(select name,otherphone,mobilephone from 
        contacts)from account];
        for(id key:oldAccount.keyset()){
                account oldAcc=oldAccount.get(key);
                account newAcc=newAccount.get(key);
                if(oldAcc.phone!=newAcc.phone){
                    for(account a:acc){
                        for(contact c:a.contacts){
                            c.OtherPhone=oldAcc.phone;
                            c.MobilePhone=newAcc.phone;
                            update c;
                        }
                    }
                }
            } 
        }

    public static void AssignContacts2ParticularAccount(List<Account> listAccount){
        list<account> acc=[select name,id,(select lastname,id,accountid from contacts)from account 
        where id in:trigger.old];
        system.debug(acc);
        account a1=[select name,id from account where name='Heaven Corp'];
        for(account a:acc){
            for(contact c:a.contacts){
                c.AccountId=a1.id;
                update c;
                system.debug('all ok');
            }
        }
    }

    public static void CreateContactChild(List<Account> lstAccounts){
        //List<Account>lstAccount=[SELECT id, name, rating,parentid FROM Account];
        List<Contact> lstContacts= new List<Contact>();
        for(Account acc: lstAccounts)
        {
            if(acc.rating =='Hot'){
                if(acc.parentid== NULL)
                {
                    For(integer i=1; i<=4;i++){
                        Contact con= new Contact();
                        if(i<=2)
                        {
                            con.lastname= 'Osmanabad'+i;
                            con.accountId=acc.id;
                        }
                        else
                        {
                            con.lastname= 'Pune'+i;
                            con.accountId=acc.id;
                        }          
                        lstContacts.add(con);
                    }  
                }
            }
        }
        if(!lstContacts.isEmpty())
        {
            insert lstContacts;
        }
    }


    public static void copyBillingToShipping(List<Account> accList){
        for(Account acc : accList){
            if(acc.CopyBillingShipping__c){
                acc.ShippingCity = acc.BillingCity;
                acc.ShippingCountry = acc.BillingCountry;
                acc.ShippingPostalCode = acc.BillingPostalCode;
                acc.ShippingState = acc.BillingState;
                acc.ShippingStreet = acc.BillingStreet;
            }
        }
    }
}