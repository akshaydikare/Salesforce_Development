public with sharing class AccountSaveFieldSet {

    public Account accObj{get;set;}

    public List<String> fieldList {get;set;}
    public AccountSaveFieldSet() {
            accObj = new Account();
            fieldList = new List<String>();
            for(Schema.FieldSetMember memberObj: SObjectType.Account.FieldSets.AccountRecordFieldSet.getFields()){
                fieldList.add(memberObj.getFieldPath());
            }
    }
    //SObjectType.Account.FieldSets.Account_FieldSet.getFields();
    //Schema.FieldSetMember
    public Pagereference AccountSave(){
        insert accObj;
        return new Pagereference('/'+accObj.Id);
    }
}