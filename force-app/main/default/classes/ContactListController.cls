public class ContactListController {
 @AuraEnabled
    public static List<Contact> getContactList(String accountId){
        List<Contact> contactList=new List<Contact>([ SELECT Id,FirstName,LastName,Name,
                                                     Email,Phone FROM Contact WHERE Email !=null AND AccountId=:accountId]);
        return ContactList;
    }
 @AuraEnabled
    public static Contact createContact(Contact con, Id AccountId){
        con.AccountId = AccountId;
        insert con;
        return con;
    }
    
}