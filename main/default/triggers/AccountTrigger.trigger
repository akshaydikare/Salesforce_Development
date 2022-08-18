trigger AccountTrigger on Account (before insert, after insert, before update, after update, before delete) {
    if(Trigger.isBefore && Trigger.isInsert){
        AccountTriggerHandler.CreateAccounts(Trigger.new);
        AccountTriggerHandler.ChangeAccountOwner(Trigger.new);
    }

    if(Trigger.isAfter && Trigger.isInsert){
        AccountTriggerHandler.addInAccountTeamMember(Trigger.new);
        AccountTriggerHandler.createTaskWhenProspectcAcount(Trigger.new);
        //AccountTriggerHandler.handleBulkRecords(Trigger.new);
    }

    if(Trigger.isBefore && Trigger.isUpdate){
        AccountTriggerHandler.updatePhonforOwnership(trigger.oldMap,trigger.newMap);

    }
    if(Trigger.isAfter && Trigger.isUpdate){
        AccountTriggerHandler.updateContactPhones(trigger.oldMap,trigger.newMap);
    }
  
}