public class oppWrapperClass {
    public  Map<Id, Integer> mapIDvsNoOfContactWrap{get;set;}
    
    public oppWrapperClass(){
        List<Contact> conList = [Select Id,AccountId from Contact];
        mapIDvsNoOfContactWrap = new Map<Id, Integer>();
        for(Contact con : conList){
            if(con.AccountId != null){
                if(mapIDvsNoOfContactWrap.containsKey(con.AccountId)){
                    Integer noOfContact = mapIDvsNoOfContactWrap.get(con.AccountId);
                    mapIDvsNoOfContactWrap.put(con.AccountId, noOfContact + 1);
                    
                }else{
                    mapIDvsNoOfContactWrap.put(con.AccountId, 1);
                }
            }
        }
    }
    public class wrapClass{
        public  Map<Id, Integer> myMap{get;set;}
        
        public wrapClass(Map<Id, Integer> mpp){
            myMap =mpp ;
        }
    }
}