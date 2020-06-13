public class CreateOppRecord {
    public static void checkOppRecord(){
        List<Opportunity> op= new List<Opportunity>();
        for(Integer i=0 ;i<5;i++){
            Opportunity a=new Opportunity(Name='testt'+ i,StageName='review'+ i,NextStep='test'+i,CloseDate=Date.today());
            op.add(a);
        }
        insert op;
    }

}