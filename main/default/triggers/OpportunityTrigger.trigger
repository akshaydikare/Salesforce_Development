trigger OpportunityTrigger on Opportunity (after update , after insert) {

 if(Trigger.isAfter &&(Trigger.isUpdate || Trigger.isInsert)){
    OpportunityTriggerHandler.ClosedOpportunityTrigger(trigger.new);
 }
 if(Trigger.isAfter && Trigger.isUpdate){
   OpportunityTriggerHandler.ShareOpportunityOnStage(trigger.oldMap, trigger.newMap);
 }
 
 if(trigger.isBefore && trigger.isInsert){
   OpportunityTriggerHandler.PrefilledFileds(Trigger.new);
 }
}