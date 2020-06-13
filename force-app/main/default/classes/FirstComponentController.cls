public class FirstComponentController {
@AuraEnabled
    public static List<Account> getAccounts(){
        return [Select Id,Name,AccountNumber from Account where AccountNumber != null LIMIT 30 ];
    }
}