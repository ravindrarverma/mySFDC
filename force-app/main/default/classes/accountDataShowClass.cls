public class accountDataShowClass {
    @AuraEnabled
    public static List<wrapperTest> getContacts(){
        List<wrapperTest> wrplst = new List<wrapperTest>();
        List<contact> conList =[select Id,AccountId, LastName from contact limit 10];
        List<opportunity> oppList =[select Id,AccountId from opportunity limit 10];
        for(contact c :conList){
            for(Opportunity o : oppList){
                wrplst.add(new wrapperTest(c,o) );  
            }
            
        }
        return wrplst;
    }
    
    public class wrapperTest{
        @AuraEnabled
        public contact con;
        @AuraEnabled
        public opportunity opp;
        
        public wrapperTest(Contact cc,opportunity o){
            this.con = cc;
            this.opp = o;
        }
    }
}