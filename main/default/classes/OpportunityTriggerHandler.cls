public class OpportunityTriggerHandler {
    public static void ShareOpportunityOnStage(Map<Id, Opportunity> oldOpty, Map<Id, Opportunity> newOpty){
        User u = [Select Id, Name from User where alias = 'apotd'];
        List<OpportunityShare> optyShareList = new List<OpportunityShare>();

        for(Id key : newOpty.keySet()){   
        Opportunity newOpportunity =  newOpty.get(key);
        Opportunity oldOpportunity =  oldOpty.get(key);
        if(oldOpportunity.StageName != 'Closed Won' && newOpportunity.StageName == 'Closed Won' ){
            if( newOpportunity.Amount > 1000){
                OpportunityShare optyShare = new OpportunityShare();
                optyShare.OpportunityId=key;
                optyShare.UserOrGroupId=u.id;
                optyShare.OpportunityAccessLevel='Read';
                optyShare.RowCause='manual';
                optyShareList.add(optyShare);
            }
        }
    }
        insert optyShareList;
    }

    public static void ClosedOpportunityTrigger(List<Opportunity> optyList){
        List<Task> tskList = new List<Task>();
        for (Opportunity opp : [SELECT Id, StageName FROM Opportunity WHERE StageName = 'Closed Won' 
        AND Id IN :optyList]){
            tskList.add(new Task(Subject = 'Follow Up Test Task',
                        WhatId = opp.Id));
            }
            if(tskList.size()>0){
                 insert tskList;   
            }
    }

    public static void PrefilledFileds(List<Opportunity> optyList){
        for(Opportunity o: optyList){
            o.stagename='Prospecting';
            o.closedate=date.today()+15;
            o.type='New Customer';
        }
    }
}