public class GroupDAO {
    public static Id getQueueByName(String queueName){
        return [SELECT Id FROM Group WHERE Type = 'Queue' AND DeveloperName = :queueName].Id;
    }
}