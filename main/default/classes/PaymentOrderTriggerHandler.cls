public class PaymentOrderTriggerHandler {
    
    public static Id paymentOrderQueue = GroupDAO.getQueueByName('Payment_Order_Pending_Approval');
   
    public static void populateFieldsOnInsert(List<Payment_Order__c> paymentOrderList){
        List<Account> accountsToInsert = new List<Account>();
        List<Payment_Order__c> paymentOrderToMap = new List<Payment_Order__c>();
        
        Map<Id,Account> mapOfAccountIdAndAccount;
        
        Set<Id> setOfAccountId = new Set<Id>();
        for(Payment_Order__c paymentOrder : paymentOrderList){
            setOfAccountId.add(paymentOrder.Account__c);
        }
        mapOfAccountIdAndAccount = new Map<Id, Account>(AccountDAO.getAccountById(setOfAccountId));
        for(Payment_Order__c paymentOrder : paymentOrderList){
            if(mapOfAccountIdAndAccount.containsKey(paymentOrder.Account__c)){
                Account paymentOrderRelatedAccount = mapOfAccountIdAndAccount.get(paymentOrder.Account__c);
                //paymentOrder.Name = paymentOrderRelatedAccount.Name;
                paymentOrder.Phone_Number__c = paymentOrderRelatedAccount.Phone;
                paymentOrder.Address_Street_1__c = paymentOrderRelatedAccount.BillingStreet;
                paymentOrder.Address_Street_2__c = paymentOrderRelatedAccount.ShippingStreet;
                paymentOrder.Zip__c = paymentOrderRelatedAccount.BillingPostalCode;
                paymentOrder.State__c = paymentOrderRelatedAccount.BillingState;
                paymentOrder.Country__c = paymentOrderRelatedAccount.BillingCountry;
                paymentOrder.Payment_amount__c = paymentOrderRelatedAccount.AnnualRevenue;
                 paymentOrder.Payee_Name__c = paymentOrderRelatedAccount.Name;
                Boolean isHighAmount = checkPaymentAmountGreaterThan2000(paymentOrder);
                if(isHighAmount){
                   paymentOrder.OwnerId = paymentOrderQueue;
               }
            }
            else{
                Account paymentOrderAccount = new Account();
                //paymentOrderAccount.Name = paymentOrder.Name;
                paymentOrderAccount.Phone = paymentOrder.Phone_Number__c;
                paymentOrderAccount.BillingStreet = paymentOrder.Address_Street_1__c;
                paymentOrderAccount.ShippingStreet = paymentOrder.Address_Street_2__c;
                paymentOrderAccount.BillingPostalCode = paymentOrder.Zip__c;
                paymentOrderAccount.BillingState = paymentOrder.State__c;
                paymentOrderAccount.BillingCountry = paymentOrder.Country__c;
                paymentOrderAccount.AnnualRevenue = paymentOrder.Payment_amount__c;
                paymentOrderAccount.Name = paymentOrder.Payee_Name__c;
                accountsToInsert.add(paymentOrderAccount);
                paymentOrderToMap.add(paymentOrder);
                Boolean isHighAmount = checkPaymentAmountGreaterThan2000(paymentOrder);
                if(isHighAmount){
                    paymentOrder.OwnerId = paymentOrderQueue;
                }
            }
        }
        if(!accountsToInsert.isEmpty()){
            try{
                AccountDAO.insertAccountDetails(accountsToInsert);
            }
            catch(Exception e){
                throw e;
            }
            for(Integer index = 0; index < paymentOrderToMap.size(); index++){
                paymentOrderToMap[index].Account__c = accountsToInsert[index].Id;
            }
        }
    }
    
    public static void mapAccountOnUpdate(List<Payment_Order__c> paymentOrderList){
        List<Account> accountsToInsert = new List<Account>();
        List<Payment_Order__c> paymentOrderToMap = new List<Payment_Order__c>();
        List<Account> listOfAllAccount = AccountDAO.getAllAccount();
        for(Payment_Order__c paymentOrder : paymentOrderList){
            Id accountId = checkAccountMatch(paymentOrder, listOfAllAccount);
            if(accountId != null){
                paymentOrder.Account__c = accountId;
                Boolean isHighAmount = checkPaymentAmountGreaterThan2000(paymentOrder);
                if(isHighAmount){
                    paymentOrder.OwnerId = paymentOrderQueue;
                }
            }
            else{
                Account paymentOrderAccount = new Account();
                //paymentOrderAccount.Name = paymentOrder.Name;
                paymentOrderAccount.Phone = paymentOrder.Phone_Number__c;
                paymentOrderAccount.BillingStreet = paymentOrder.Address_Street_1__c;
                paymentOrderAccount.ShippingStreet = paymentOrder.Address_Street_2__c;
                paymentOrderAccount.BillingPostalCode = paymentOrder.Zip__c;
                paymentOrderAccount.BillingState = paymentOrder.State__c;
                paymentOrderAccount.BillingCountry = paymentOrder.Country__c;
                paymentOrderAccount.AnnualRevenue = paymentOrder.Payment_amount__c;
                paymentOrderAccount.Name = paymentOrder.Payee_Name__c;
                Boolean isHighAmount = checkPaymentAmountGreaterThan2000(paymentOrder);
                if(isHighAmount){
                    paymentOrder.OwnerId = paymentOrderQueue;
                }
            }
        }
        try{
            AccountDAO.insertAccountDetails(accountsToInsert);
        }
        catch(Exception e){
            throw e;
        }
        for(Integer index = 0; index < paymentOrderToMap.size(); index++){
            paymentOrderToMap[index].Account__c = accountsToInsert[index].Id;
        }
    }
    
    
    
    public static Id checkAccountMatch(Payment_Order__c paymentOrder, List<Account> accountList){
        for(Account paymentOrderRelatedAccount : accountList){
            if(paymentOrder.Payee_Name__c == paymentOrderRelatedAccount.Name && paymentOrder.Phone_Number__c == paymentOrderRelatedAccount.Phone &&
               paymentOrder.Address_Street_1__c == paymentOrderRelatedAccount.BillingStreet && paymentOrder.Address_Street_2__c == paymentOrderRelatedAccount.ShippingStreet &&
               paymentOrder.Zip__c == paymentOrderRelatedAccount.BillingPostalCode && paymentOrder.State__c == paymentOrderRelatedAccount.BillingState &&
               paymentOrder.Country__c == paymentOrderRelatedAccount.BillingCountry){
                   return paymentOrderRelatedAccount.Id;
               }
        }
        return null;
    }
   
    public static Boolean checkPaymentAmountGreaterThan2000(Payment_Order__c paymentOrder){
        if(paymentOrder.Payment_Amount__c > 2000){
            paymentOrder.Status__c = 'Pending Approval';
            return true;
        }
        return false;
    }
}