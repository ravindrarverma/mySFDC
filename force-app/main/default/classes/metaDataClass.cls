public class metaDataClass {
    public static void methodd(List<Contact> conList){
        if(conList != null && !conList.isEmpty() ){
            List<Rate__mdt>  rates =[select Id,Rate_for_0_To_499__c,Rate_for_500_To_999__c,Rate_for_1000_To_1499__c,Rate_for_1500__c
                                     from Rate__mdt limit 1 ];
            if(rates != null && !rates.isEmpty()){
                for(Contact con : conList){
                    if(String.isNotBlank(con.TotalCaseResolved__c)){
                    if(con.TotalCaseResolved__c =='0 To 499'){
                        con.Amount_New__c = rates[0].Rate_for_0_To_499__c;
                    }else if(con.TotalCaseResolved__c =='500 To 999'){
                         con.Amount_New__c = rates[0].Rate_for_500_To_999__c;
                    }else if(con.TotalCaseResolved__c =='1000 To 1499'){
                         con.Amount_New__c = rates[0].Rate_for_1000_To_1499__c;
                    }else{
                        con.Amount_New__c = rates[0].Rate_for_1500__c;
                    }
                    }}
            }
        }
        
        
    }

}