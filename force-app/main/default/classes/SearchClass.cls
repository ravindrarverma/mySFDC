public class SearchClass {
    public String searchstring { get; set; }
    public list<Account> accountList{get;set;}
    public list<Account> accList{get;set;}
    public String aId{get;set;}
    
    public SearchClass(){
        accountList = new list<Account>();
        accountList = [SELECT Id, Name,Phone FROM Account LIMIT 1000];
        system.debug('Account List'+ accountList); 
    }
    public PageReference showDetail() {
        pagereference ref = new pagereference('"https://r-k-v-dev-ed.my.salesforce.com/apex/accDetails1?att='+aId);
        ref.setredirect(true);
        return ref;
    }
    
    public PageReference search() {
        accountList.clear();
        accountList = [SELECT Id,Name,Phone FROM Account WHERE Name =:searchstring  OR Phone =:searchstring ];
        // accountList = [SELECT Name,Phone FROM Account WHERE Name LIKE '%searchstring%' OR Phone LIKE '%searchstring%' ];
        return null;}
    
    public PageReference clear() {
        accountlist.clear();
        accountList = [SELECT Id ,Name,Phone FROM Account LIMIT 100];
        return null;
        
    }
    
}