public with sharing class AccountController_ApexInLWC {
        @AuraEnabled(cacheable=true)
        public static List<Account> getAccountList(){
            return [SELECT Id, Name, Type, Industry from Account LIMIT 7];
        }


        @AuraEnabled(cacheable=true)
        public static List<Account> filterAccountByType(String type){
            return [SELECT Id, Name, Type from Account where Type = :type LIMIT 7];
        }

        @AuraEnabled(cacheable=true)
        public static List<Account> findAccounts(String searchKey){
            String key = '%' + searchKey + '%';
            return [SELECT Id, Name, Type, Industry FROM Account WHERE Name LIKE :key LIMIT 5];
        }
    
}