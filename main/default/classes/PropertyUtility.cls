public class PropertyUtility { 
    public static void newListedProperties(){
       List<Property__C> newPropList = [Select Name,Broker__r.Email__c, Days_On_Market__c from Property__C Where Date_Listed__c = LAST_N_DAYS:30]; 
        for(Property__C prop : newPropList){
           String propEmail = prop.Name + ' : ' + prop.Broker__r.Email__c;   
            System.debug(propEmail);
        }
    }
}