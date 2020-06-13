public class taxCalculaor {
    public List<Account> taxList{get;set;}
     public ID accid {set;get;}
   public  taxCalculaor(){
      // taxList= new List<Account>();
        taxList=[select id,Name,isUniformPersonnel__c,isCivilServant__c,isScientist__c,Age__c,Salary__c,Total_Tax__c from Account];
        System.debug('check taxlist value-->' +taxlist);
        for(Account tl: taxList){
            if (tl.Age__c < 18) {
                if (tl.Salary__c > 0 && tl.Salary__c <250001) {
                    tl.Total_Tax__c=0;
                } else if (tl.Salary__c > 250000 && tl.Salary__c <500001) {
                    tl.Total_Tax__c=10000;
                } else if (tl.Salary__c > 500000 && tl.Salary__c <1000001) {
                    tl.Total_Tax__c=20000 + (tl.Salary__c)/20;
                } else if (tl.Salary__c > 1000000 && tl.Salary__c <10000001) {
                    tl.Total_Tax__c=30000 + (tl.Salary__c)/5;
                } else {
                    tl.Total_Tax__c=500000 + 3*(tl.Salary__c)/20;
                }
            } else if (tl.Age__c > 17 && tl.Age__c < 61) {
                if (tl.Salary__c > 0 && tl.Salary__c <250001) {
                    tl.Total_Tax__c=5000;
                } else if (tl.Salary__c > 250000 && tl.Salary__c <500001) {
                    tl.Total_Tax__c=20000 + (tl.Salary__c)/20;
                } else if (tl.Salary__c > 500000 && tl.Salary__c <1000001) {
                    tl.Total_Tax__c=20000 + (tl.Salary__c)/10;
                } else if (tl.Salary__c > 1000000 && tl.Salary__c <10000001) {
                    tl.Total_Tax__c=20000 + 3*(tl.Salary__c)/10;
                } else {
                    tl.Total_Tax__c=500000 + (tl.Salary__c)/4;
                }
            } else if (tl.Age__c > 60 && tl.Age__c < 71) {
                if (tl.Salary__c > 0 && tl.Salary__c <250001) {
                    tl.Total_Tax__c=0;
                } else if (tl.Salary__c > 250000 && tl.Salary__c <500001) {
                    tl.Total_Tax__c=5000;
                } else if (tl.Salary__c > 500000 && tl.Salary__c <1000001) {
                    tl.Total_Tax__c=20000 + (tl.Salary__c)/20;
                } else if (tl.Salary__c > 1000000 && tl.Salary__c <10000001) {
                    tl.Total_Tax__c=20000 + (tl.Salary__c)/5;
                } else {
                    tl.Total_Tax__c=500000 + 3*(tl.Salary__c)/20;
                }
            } else {
                if (tl.Salary__c > 0 && tl.Salary__c <250001) {
                    tl.Total_Tax__c=0;
                } else if (tl.Salary__c > 250000 && tl.Salary__c <500001) {
                    tl.Total_Tax__c=0;
                } else if (tl.Salary__c > 500000 && tl.Salary__c <1000001) {
                    tl.Total_Tax__c=30000;
                } else if (tl.Salary__c > 1000000 && tl.Salary__c <10000001) {
                    tl.Total_Tax__c=20000 + (tl.Salary__c)/10;
                } else {
                    tl.Total_Tax__c=500000 + (tl.Salary__c)/10;
                }
            }   
            if (tl.isUniformPersonnel__c == true) {
                tl.Total_Tax__c=tl.Total_Tax__c-(tl.Total_Tax__c)/5;
            } else if (tl.isCivilServant__c == true) {
                tl.Total_Tax__c=tl.Total_Tax__c-(tl.Total_Tax__c)/20;
            } else if (tl.isScientist__c == true) {
                tl.Total_Tax__c=tl.Total_Tax__c-(tl.Total_Tax__c)/20;
            }  
        }
        upsert taxList;
    }
     public PageReference showDetail() {
        pagereference ref = new pagereference('"https://r-k-v-dev-ed.my.salesforce.com/apex/TaxDetails?att='+accid);
        ref.setredirect(true);
        return ref;
    }
    
}