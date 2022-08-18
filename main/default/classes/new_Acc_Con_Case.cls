public class new_Acc_Con_Case {
    public List<Contact> conList;
    public List<Case> casesList;

    public new_Acc_Con_Case(){
        conList=new List<Contact>();
        casesList=new List<Case>();  
    }
    
    public void showData(){
             Account acc=new Account();
       
        acc.name='Infosys';
        acc.phone='12345';
        acc.website='www.infosys.com';
        acc.Industry='Technology';
        acc.Rating='Hot';
        insert acc;
        
        For(integer i=1; i<=5; i++){
             Contact con=new Contact();
            con.lastName=acc.name+'- contact'+i;
            con.Email='xyz'+i+'@gmail.com';
            con.Phone='12345';
            con.LeadSource='Web';
            con.AccountId=acc.id;
            conList.add(con);
        }
        insert conList; 

        
        For(integer i=1;i<=10; i++){
                Case cases=new Case();
            cases.type='Electrical';
            cases.status='Working';
            cases.origin='Phone';
            cases.Priority='High';
            cases.AccountId=acc.id;
            casesList.add(cases);
        }
        insert casesList;
    }
}