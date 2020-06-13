public class DropdowndataClass { 
    @AuraEnabled
    public static List <Opportunity> fetchAccounts(String searchParam) {
        List<Opportunity> oppList = new  List<Opportunity>(); 
        if( searchParam == 'Recently Created'){
             oppList = [SELECT Id,AccountId,Name from Opportunity order by CreatedById asc limit 20];
        }else if(searchParam == 'Recently Updated'){
            oppList = [SELECT Id,AccountId,Name from Opportunity order by LastModifiedById desc limit 10];
        }else{
              oppList = [SELECT Id,AccountId,Name from Opportunity WHERE StageName Like :searchParam LIMIT 20];
       
        }
        return oppList;
    }
}