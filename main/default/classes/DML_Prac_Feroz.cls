public class DML_Prac_Feroz {
    public static void CreateBulkProspects()
    {
        List<Lead> lstLeads = new List<Lead>();
        
        For(integer counter=1; counter<= 100; counter++)
        {
            Lead ld = new Lead();
            ld.firstname= 'Bulk';
            ld.LastName= 'Lead Record- '+counter;
            ld.Company='Salesforce Inc.';
            ld.status= 'Open- Not Connected';
            ld.Rating='Warm';
            ld.Industry='Technology';
            ld.AnnualRevenue=34450000;
            ld.phone='9883654622';
            ld.Email= 'bulklead'+counter+'@gmail.com';
            ld.LeadSource='web';
            
            lstLeads.add(ld);
        }
        
        if(! lstLeads.isEmpty())
            insert lstLeads;
        
        system.debug('Number of DML Statements Used: '+Limits.getDmlStatements());
        system.debug('Number of DML Statements Limits: '+Limits.getLimitDmlStatements());
        system.debug('Number of DML Records Processed: '+Limits.getDmlRows());
        system.debug('Max. Number of DML Rows Limit: '+Limits.getLimitDmlRows());
    }
    
    public static void DeleteLeadRecordsByStartingChars(String startingChars)
    {
        /* if(startingChars != null && startingChars!='')
{
startingChars +='%';

List<Lead> lstLeads = [Select id, firstname, lastname from Lead
where Lastname like: startingChars];

if(! lstLeads.isEmpty())
Delete lstLeads;
} */
        Delete[Select id, Firstname, Lastname From Lead
               Where lastname Like : startingChars+'%']; 
        system.debug('Number Of Records Deleted '+Limits.getDmlRows());
    }
    
    public static void RestoreLeadsByStartingChars(string startingChars)
    {
        if(startingChars != null && startingChars !='')
        {
            UnDelete[Select id, Firstname, lastname, isDeleted From Lead 
                     Where lastname like: startingChars+'%' and 
                     isDeleted = true ALL ROWS];
            
            system.debug('Number of DML Statements Used: '+Limits.getDmlStatements());
            system.debug('Number of DML Records Processed: '+Limits.getDmlRows());
            
            
        }
    }
    
    public static void UpdateBankingCustomers()
    {
        List<Account> lstAccounts = [Select id, name, rating, industry from Account Where industry = 'Banking'];
        if (! lstAccounts.isEmpty())
        {
            For(Account acc: lstAccounts)
            {
                acc.rating='Hot';
            }
            update lstAccounts;
        }
    }
    
    public static void DeActivateUser(string uName)
    {
        if( uName!= null && uName !='')
        {
            User userToDeactivate = [Select id, Firstname, lastname, username, isActive From user
                                     Where userName=: uName
                                     Limit 1];
            if(userToDeactivate.id != Null)
            {
                userToDeactivate.IsActive= false;
                Update userToDeactivate;
            }
        }
    }
    
    public static void AutoPoulateAnnualRevenue()
    {
        List<Account>lstAccounts = new List <Account>();
        
        For(Account acc :[Select id, name, industry, annualRevenue From Account])
        {
            Switch ON acc.Industry
            {
                When 'Banking'
                {
                    acc.AnnualRevenue= 8000000;
                }
                When 'Energy'
                {
                    acc.AnnualRevenue= 6500000;
                }
                When 'Agriculture'
                {
                    acc.AnnualRevenue= 5000000;
                }
                When 'Manufacturing'
                {
                    acc.AnnualRevenue= 7400000;
                }
                When 'Insurance'
                {
                    acc.AnnualRevenue= 10000000;
                }
            }
            lstAccounts.add(acc);
        }       
        if(! lstAccounts.isEmpty())
        {
            Update lstAccounts;
        }
    }
    
    public static void UpsertCaseRecords()
    {
        // Create a List Collection to hold the Combined Records.
        List<Case> casesToUpsert = new List<Case>();
        
        // Cases to Update.
        List<Case> lstCases= [Select id, Status, Priority, caseNumber from Case Where Status= 'New'];
        
        system.debug('Number Of records to Update: '+ lstCases.size());
        
        if(! lstCases.isEmpty())
        {
            for(Case cs: lstCases)
            {
                cs.priority= 'Medium';
                casesToUpsert.Add(cs);
            }
        }
        //Create New Case Record
        Case cs= new Case();
        cs.status= 'New';
        cs.Priority='High';
        cs.Type='Mechanical';
        cs.Reason='Performance';
        cs.Origin='Web';
        cs.Subject='My Scanner is Not Working';
        cs.Description='Dear Customer Support, My Newly Purchased Scanner is not Working Properly.'+
            'it is unable to scan the image documents. please have a look into the issue and resolve ASAP.'+
            'Thanks & Regards, Akshay';
        
        // Add the Record to collection.
        casesToUpsert.add(cs);
          system.debug('Total Of records: '+ casesToUpsert.size());
        //Upsert the Collection of Records to the Object.
        if( !casesToUpsert.isEmpty())
            Upsert casesToUpsert;
        
        system.debug('Number Of DML Statements Used: '+system.Limits.getDmlStatements());
        system.debug('Number of DML Rows Processed: '+system.Limits.getDmlRows());
    }
    
    public static void MergeDuplicateAccounts ()
    {
        Account TargetAccount= [select id, name, rating, industry, annualrevenue, type, ownership, phone, fax
                                from Account Where name= 'Sharing Rule Account' Limit 1];
        
        Account SourceAccount= [select id, name, rating, industry, annualrevenue, type, ownership, phone, fax
                                from Account Where name= 'Manual Sharing Account' Limit 1];
        
        if (sourceAccount!=null && targetAccount!=null)
        {
            Merge targetAccount sourceAccount;
        }
    }
    
 /*  public static void CreateBulkHRRecords()
    {
        List<Hiring_Manager__c> lstHRRecords = new List<Hiring_Manager__c>();
        
        for(integer Counter=1; Counter<=50; Counter++)
        {
            Hiring_Manager__c hr=new Hiring_Manager__c();
            hr.name='Sample HR- '+Counter;
            hr.Contact_Number__c ='9884323454';
            if(Counter != 48)
            {
                hr.Email_ID__c='samplehr'+Counter+'@test.com';
            }
            hr.Location__c='Pune';
            
            lstHRRecords.Add(hr);
        }
            if(! lstHRRecords.isEmpty())
            {
                Database.SaveResult[] results = Database.insert(lstHRRecords, false);
                
                for(Database.SaveResult res : results)
                {
                    if(res.isSuccess())
                    {
                        system.debug('Record Inserted Successfully. ');
                        system.debug('Record ID is '+res.getID());
                    }
                    else
                    {
                        for(Database.Error err : res.getErrors())
                        {
                            system.debug('Erro MEssage is: '+err.GetMessage());
                            system.debug('Get Error Status code: '+err.getStatusCode());
                            system.debug('Get Affected Fields: '+err.getFields());
                        }
                    }
                    system.debug('==============================================================');
                }
            }
        
    }*/
    
    public static void CreateBulkHRRecords()
    {
        List<Hiring_Manager__c> lstHRRecords = new List<Hiring_Manager__c>();
        
        for(integer Counter=1; Counter<=50; Counter++)
        {
            Hiring_Manager__c hr=new Hiring_Manager__c();
            hr.name='Sample HR- '+Counter;
            hr.Contact_Number__c ='9884323454';
            if(Counter != 48)
            {
                hr.Email_ID__c='samplehr'+Counter+'@test.com';
            }
            hr.Location__c='Pune';
            
            lstHRRecords.Add(hr);
        }
        
        if(! lstHRRecords.isEmpty())
        {
            Database.SaveResult[] results = Database.insert(lstHRRecords, false);
            
            for(Database.SaveResult res : results)
            {
                if(res.isSuccess())
                {
                    system.debug('Record Inserted Successfully. ');
                    system.debug('Record ID is '+res.getID());
                }
                else
                {
                    for(Database.Error err : res.getErrors())
                    {
                        system.debug('Error MEssage is: '+err.GetMessage());
                        system.debug('Get Error Status code: '+err.getStatusCode());
                        system.debug('Get Affected Fields: '+err.getFields());
                    }
                }
                system.debug('==============================================================');
            }
        }
    }
}