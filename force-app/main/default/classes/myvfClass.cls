public class myvfClass {
    public list<Account> accList{get;set;}
    public myvfClass(){
        accList= new List<Account>();
        accList=[select id,Name from account limit 10];
    }
    public void accountDetails(){
        accList= new List<Account>();
        accList=[select id,Name from account limit 20];
    }
    

}