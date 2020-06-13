public class NumberOfContacts {
    public static void checkNoOfContact(){
        List<Account> accList = [Select Id from Account];
        List<Contact> conList = [Select Id,AccountId from Contact where AccountId != null];
        Integer count = 0;
        List<Account> newAccList = new List<Account>();
        for(Account acc : accList){
            count = 0;
            for(Contact con : conList){
                if(con.AccountId == acc.Id){
                    count++;
                }
            }
            acc.Number_of_Contacts__c = count;
            newAccList.add(acc);
        }
        update newAccList;
    }
}