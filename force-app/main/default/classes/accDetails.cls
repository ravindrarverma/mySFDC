public class accDetails {
    public list<Account> accList{set;get;}
    public list<Account> accList1{set;get;}
    public accDetails(){
        accList=new List<Account>();
        accList1=new List<Account>(); 
        accList=[select Id, Name,Country__c, subject__c from Account];
        accList1=[select Name,phone from Account limit 200];
    }
}