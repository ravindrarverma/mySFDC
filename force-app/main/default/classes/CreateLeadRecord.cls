public class CreateLeadRecord {
    public static void checkLeadRecord(){
        List<Lead> ld= new List<Lead>();
        for(Integer i=0 ;i<5;i++){
            Lead a=new Lead(LastName='rkv'+ i,Company='San Francisco'+i,Fax='Fax' + i);
            ld.add(a);
        }
        insert ld;
    }

}