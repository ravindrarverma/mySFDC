public class Fetch10AccountObjectReacords {
    public static void checkFetchRecord(){
        List<Account> acc=[SELECT Name,Phone FROM Account LIMIT 10];
        System.debug(acc);
        List<Contact> ac=[SELECT Name,Phone FROM Contact LIMIT 10];
        System.debug(ac);
            
        }
    }