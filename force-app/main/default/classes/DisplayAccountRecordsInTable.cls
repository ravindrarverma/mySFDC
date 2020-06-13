public class DisplayAccountRecordsInTable {
    @AuraEnabled
    public static List<wrapperExample> getAccounts(){
        List<wrapperExample> wrapList = new  List<wrapperExample>();
        List<Account> accList = [Select Id,Name,AccountNumber,Fax,Description from Account  LIMIT 10];
        List<Contact> conList = [Select Id,AccountId,LastName from Contact  LIMIT 10];
        for(Account acc1 : accList){
            for(Contact con1 : conList){
               wrapperExample wp = new wrapperExample();
                wp.acc = acc1;
                wp.con = con1;
                wrapList.add(wp);
            }
        }
        return wrapList;
        
    }
    
    
    public class wrapperExample{
       @AuraEnabled
        public  Account acc;
       @AuraEnabled
        public  Contact con;
            
        
        
    }
    
}