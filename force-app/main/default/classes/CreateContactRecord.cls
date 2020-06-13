public class CreateContactRecord {
    public static void checkContactField(){
        List<Contact> con= new List<Contact>();
        for(Integer i=0 ;i<5;i++){
            Contact a=new Contact(LastName='rkv'+ i,Department='San Francisco'+i,Fax='Fax' + i,LeadSource='LeadSource' +i);
            con.add(a);
        }
        insert con;
    }

}