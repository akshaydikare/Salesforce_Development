trigger AccountTrigger2 on Account (before delete, after Insert, after update) {
    if(Trigger.isbefore && Trigger.isDelete){
        AccountTriggerHandler.AssignContacts2ParticularAccount(trigger.old);
    }

    if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate)){
    AccountTriggerHandler.CreateContactChild(Trigger.new);

    }
}