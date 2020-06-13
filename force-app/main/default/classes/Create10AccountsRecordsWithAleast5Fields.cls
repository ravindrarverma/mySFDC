public class Create10AccountsRecordsWithAleast5Fields {
    public static void checkAccountField(){
        List<Account> accts = new List<Account>();
        
        for(Integer i=0;i<5;i++) {
            
            Account a = new Account(Name='Acme' + i,Industry='San Francisco',Fax='Fax' + i,Site='Site' +i);
            accts.add(a);
        }
            insert accts;
        
        
    }
    
}