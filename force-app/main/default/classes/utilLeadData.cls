public class utilLeadData {
    public void leadMethod(List<Lead> leadList){
        for(Lead ld :leadList){
            if(ld.status == 'Closed - Converted'){
                ld.addError('lead object not create  in Closed - Converted status and not updated');
            }
        }
    }

}