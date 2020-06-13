public class testWrapperClass {
    public List<WrapperClass> wrapperlist{get;set;}
    
    public testWrapperClass(){
        wrapperlist =new List<WrapperClass>();
        List<Account> accList = [Select Id,Name,Phone,ClosedLostTotal__c,ClosedWonTotal__c from account Limit 10];
        Set<Id> Ids = new Set<Id>();
        for(Account acc:accList){
            Ids.add(acc.Id);
        }
        List<Contact>  conList = [Select Id,AccountId,LastName from contact where AccountId IN:Ids ];
        for(Account acc:accList){
            for(Contact con : conList){
           wrapperlist.add(new WrapperClass(acc,con) ); 
        }
        }
    }
    
    public class WrapperClass{
        public Account accName{get;set;}
        public Contact conName{get;set;}
        public WrapperClass(Account aa, Contact st){
           this.accName=aa;
            this.conName = st;
        }
    }
}