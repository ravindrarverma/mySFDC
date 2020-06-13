public class utilClass {
    /*We are having the requirement to insert dummy Contact record as a related object on
Account when the Account record is created.*/
    //  List<contact> conList=new List<contact>(); //if mehtod will be not static this is correct means declare here.
    public static void accountMethod(List<Account> accList){
        List<contact> conList=new List<contact>(); // it is declare here bcoz method is static so scope of list colud not be outside.
        for(Account acc :accList){
            Contact con = new Contact();
            con.LastName = acc.Name;
            con.AccountId = acc.Id ;
            con.FirstName ='Ravindra contact';
            conList.add(con);
        }
        if(conList.size()>0){
            insert conList;
        }
    }
    /*We are having the requirement that when an account record is updated, we need to update
all related contact record phone number field with the Account phone number.
*/
    public static void acUpdatedContactPhUpdatee(List<Account> acList ){
        List<Contact> conList1 = new List<Contact>();
        Set<Id> Ids =new Set<Id>();
        for(Account acc:acList){
            Ids.add(acc.Id); 
        }
        List<Contact> conList = [select Id,AccountId, Phone from Contact where AccountId IN: Ids ];
        for(Contact ct :conList){
            for(Account obj:acList){
                ct.Phone = obj.Phone; 
                conList1.add(ct);
            }
        }
        if(conList1.size()>0){
            update conList1; 
            System.debug('conList1-->'+conList1);
        }
    }
    /*We are having the requirement to prevent deletion of Account record if it has parent
Account associated with it.*/
    public static void preventDeletionOfAccountRecd(List<Account> acList){
        for(Account acc:acList){
            if(acc.ParentId != null){
            acc.addError('u can not delete the account bcoz it have the parent account');
        }  } 
    }
    /*We are having the requirement to delete the child object records associated with Account
record when the Account record is deleted. “Childobject” is a related list on Account.*/
    public Static void deleteChildassociatedAccountDeleted(List<Account> acList){
        List<Contact> conList2 = new List<Contact>();
        Set<Id> Ids =new Set<Id>();
        for(Account acc:acList){
            Ids.add(acc.Id); 
        }
        List<Contact> conList = [select Id, AccountId from Contact where AccountId IN: Ids ];
        for(Account acc: acList){
            for(Contact cc :conList){
               conList2.add(cc); 
            }
            }
        if(conList2.size()>0){
            delete conList2;
        }
    }
}