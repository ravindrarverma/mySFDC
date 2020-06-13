public class accDetails1 {
    //public list<Account> accList1{get;set;}
    public Account accList1{get;set;}
    public String RecordId {get;set;}
    public accDetails1(ApexPages.StandardController controller){
       // accList1=new List<Account>();
        RecordId  = ApexPages.CurrentPage().getparameters().get('att');
        accList1=[select Id, Name,AccountNumber,phone,Industry from Account where id =: RecordId];
    }
}