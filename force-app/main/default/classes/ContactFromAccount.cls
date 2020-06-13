public class ContactFromAccount {
    public static void printContact(){
        List<Account> accList = [Select Id from Account Limit 1];
        List<Contact> conList = [Select Id, LastName from Contact where AccountId=: accList[0].Id];
        
        System.Debug(conlist);
    }
    
}