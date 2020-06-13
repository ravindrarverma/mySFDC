public class createTestClass {
    public static void method1(List<Account> newList,List<Account> oldList){
        for(Account obj:newList){
            system.debug('New Value of phone'+obj.phone);
        }
        for(Account obj1:oldList){
            system.debug('Old Value of phone'+obj1.phone);
        }
    }
    public static void method2(List<Account> newList,List<Account> oldList,Map<id,Account>
                               newMap,Map<id,Account> oldMap){
                                   for(Account obj:newList){
                                       system.debug('New Value of phone from newMap'+newMap.get(obj.id).phone);
                                   }
                                   for(Account obj1:oldList){
                                       system.debug('Old Value of phone from oldMap'+oldMap.get(obj1.id).phone);
                                   }
                               }
    public static  void method3(List<Account> newList,List<Account> oldList){
        system.debug('Is trigger executing----->'+trigger.isexecuting);
        if(trigger.isexecuting){ // Checking If the current context for the apex code is a trigger.
                for(Account newAcc:newList){
                    for(Account oldAcc:oldList){
                        if(newAcc.id==oldAcc.id){
                            if(newAcc.phone!=oldAcc.phone){
                                newAcc.PhoneNumberChanged__c=True;
                            }
                        }
                    }
                }
        }
    }
    
    
}