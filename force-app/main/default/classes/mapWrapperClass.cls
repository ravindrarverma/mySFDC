public class mapWrapperClass {
    public List<wrapperClass> wrapList{get;set;}
    public List<wrapperClass> selectedAccounts{get;set;}
    
    public mapWrapperClass(){
        wrapList = new  List<wrapperClass>();
        List<Opportunity> oppWonList = [Select Id,AccountId,StageName,Amount from Opportunity where ( StageName ='Closed Won' )];
        Map<Id, Double> accountIDAndNoOfOppWonMap = new Map<Id, Double>();
        for(Opportunity opp : oppWonList){
            if(opp.AccountId != null){
                If(accountIDAndNoOfOppWonMap.containskey(opp.AccountId)){
                    Double db = accountIDAndNoOfOppWonMap.get(opp.AccountId);
                    db = db + opp.Amount;
                    accountIDAndNoOfOppWonMap.put(opp.AccountId, db);
                }else{
                    accountIDAndNoOfOppWonMap.put(opp.AccountId,opp.Amount);
                    
                }
            }
        }
        List<Opportunity> oppLostList = [Select Id,AccountId,StageName,Amount from Opportunity where ( StageName ='Closed Lost')];
        Map<Id, Double> accountIDAndNoOfOppLostMap = new Map<Id, Double>();
        for(Opportunity opp : oppLostList){
            if(opp.AccountId != null){
                If(accountIDAndNoOfOppLostMap.containskey(opp.AccountId)){
                    Double db = accountIDAndNoOfOppLostMap.get(opp.AccountId);
                    db = db + opp.Amount;
                    accountIDAndNoOfOppLostMap.put(opp.AccountId, db);
                }else{
                    accountIDAndNoOfOppLostMap.put(opp.AccountId,opp.Amount);
                    
                }
            } 
        }
        Map<Id, Integer> mapIDvsNoOfContact = new Map<Id, Integer>();
        List<Contact> conList = [Select Id,AccountId from Contact ];
        for(Contact con : conList){
            if(con.AccountId != null){
                if(mapIDvsNoOfContact.containsKey(con.AccountId)){
                    Integer noOfContact = mapIDvsNoOfContact.get(con.AccountId);
                    mapIDvsNoOfContact.put(con.AccountId, noOfContact + 1);
                }else{
                    mapIDvsNoOfContact.put(con.AccountId, 1);
                }
            }
        }
        Map<Id,Account> mapIdvsAccount = new  Map<Id,Account>();
        List<Account> accList =[select Id,Name,Phone from Account];
        for(Account a :accList){
            mapIdvsAccount.put(a.Id,a );
        }
        Map<Id,Contact> mapIdvsContact = new  Map<Id,Contact>();
        List<Contact> conList1 =[select Id,AccountId,LastName from Contact];
        for(Contact a :conList1){
            mapIdvsContact.put(a.AccountId,a );
        }
        Map<Id,opportunity> mapIdvsopportunity = new  Map<Id,opportunity>();
        List<opportunity> oppList =[select Id,AccountId,Name,StageName from opportunity];
        for(opportunity a :oppList){
            mapIdvsopportunity.put(a.AccountId,a );
        }
        Map<Id ,Double> mapSumOfWonndLost = new Map<Id ,Double>(); //rates != null && !rates.isEmpty()
        for(opportunity oo : oppList){
            If(oo.AccountId != null){
                Double val1 = 0 ;
                Double val2 = 0;
                If(accountIDAndNoOfOppWonMap.containskey(oo.AccountId)){
                   val1 = accountIDAndNoOfOppWonMap.get(oo.AccountId);
                }
                If(accountIDAndNoOfOppLostMap.containskey(oo.AccountId)){
                   val2 = accountIDAndNoOfOppLostMap.get(oo.AccountId);
                }
                    Double abc = (val1  + val2);
                    mapSumOfWonndLost.put(oo.AccountId, abc); 
                }
                
            }
            
        
        if(accList.size()>0){
            for(Account acc:accList){
                Double amt1 =0, amt2=0;
                If(accountIDAndNoOfOppWonMap.containskey(acc.Id)){
                   amt1 = accountIDAndNoOfOppWonMap.get(acc.Id);
                }
                If(accountIDAndNoOfOppLostMap.containskey(acc.Id)){
                   amt2 = accountIDAndNoOfOppLostMap.get(acc.Id);
                }
                    
                
                wrapList.add(new wrapperClass(mapIdvsAccount.get(acc.Id),mapIdvsContact.get(acc.Id),
                                              mapIdvsopportunity.get(acc.Id),mapIDvsNoOfContact.get(acc.Id),
                                              amt1, amt2,
                                              mapSumOfWonndLost.get(acc.Id) ));
            } 
        } 
    }
    public void processSelected() {
        selectedAccounts = new List<wrapperClass>();
        
        for(wrapperClass Obj : wrapList) {
            if(Obj.selected == true) {
                selectedAccounts.add(Obj);
            }
        }
    }
    public class wrapperClass{
        public Account acc{ get ;set;}
        public Contact con{ get ;set;}
        public Opportunity opp{ get ;set;}
        public Integer inn{ get ;set;}
        public Double dbw{ get ;set;}
        public Double dbl{ get ;set;}
        public Double swl{ get ;set;}
        public Boolean selected {get; set;}
        public wrapperClass(Account a,Contact c,Opportunity op,Integer i,Double dw,Double dl,Double dwl){
            this.acc = a;
            this.con = c;
            this.opp = op;
            this.inn = i;
            this.dbw = dw;
            this.dbl = dl;
            this.swl = dwl;
            selected = false;
        }
    }
}