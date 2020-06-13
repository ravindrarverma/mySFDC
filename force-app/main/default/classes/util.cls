public class util {
    public static void utilmethod(List<Account> accList){
        List<internship__c> listIntern = new List<internship__c>();
        
        List<internship__c> existingInternList=[select Count__c,Id,Country__c,Month__c, Subject__c, Year__c  from  internship__c ];
         Map<String,internship__c> mapKeyVsIntershipRecord=new   Map<String,internship__c>();
        //key-----country+suject+month+Year
        if(existingInternList!=null && existingInternList.size()>0){
            for(internship__c interObj: existingInternList){
                system.debug('Exiting key date --->' + interObj.Country__c+'#'+interObj.Subject__c+'#'+interObj.Month__c+'#'+interObj.Year__c);
                mapKeyVsIntershipRecord.put(interObj.Country__c+'#'+interObj.Subject__c+'#'+interObj.Month__c+'#'+interObj.Year__c,interObj);
            }
            
            
        }
        system.debug('End mapKeyVsIntershipRecord --->' + mapKeyVsIntershipRecord);
        
        
        
    for(Account acc: accList){
       
        date startDate=acc.Start_Date__c;
        date endDate=acc.End_Date__c;
        system.debug('End date --->' + endDate);
        system.debug('Start date-->' + startDate);
        Integer startYear=startDate.year();
        Integer startMonth=startDate.month();
        system.debug('Start Year-->' + startYear);
        system.debug('Start Month-->' +startMonth);
        Integer difference=startDate.monthsBetween(endDate);
        
        Map<Integer, String> m1 = new Map<Integer, String>();
        m1.put(1, 'Jan');m1.put(2, 'Feb');
        m1.put(3, 'Mar');m1.put(4, 'Apr');
        m1.put(5, 'May');m1.put(6, 'Jun');
        m1.put(7, 'Jul');m1.put(8, 'Aug');
        m1.put(9, 'Sep');m1.put(10, 'Oct');
        m1.put(11, 'Nov');m1.put(12, 'Dec');
        
        for(Integer i=0;difference>i;i++ ){
            system.debug('End key --->' + acc.Country__c+'#'+acc.Subject__c+'#'+m1.get(startMonth)+'#'+startYear);
            if(mapKeyVsIntershipRecord.containskey(acc.Country__c+'#'+acc.Subject__c+'#'+m1.get(startMonth)+'#'+startYear)){
               internship__c existing= mapKeyVsIntershipRecord.get(acc.Country__c+'#'+acc.Subject__c+'#'+m1.get(startMonth)+'#'+startYear);
                
                system.debug('Start existing.Count__c-->' + existing.Count__c);
                if(existing.Count__c!=null){
                existing.Count__c=existing.Count__c+1;
                }
                
                system.debug('end existing.Count__c-->' + existing.Count__c);
                listIntern.add(existing);
            }
            else{
                    internship__c intern =new internship__c();
                    intern.Country__c = acc.Country__c;
                    intern.Subject__c = acc.Subject__c;
                    intern.Month__c =m1.get(startMonth);
                    intern.Year__c=startYear;
                    intern.Count__c=1;
                    listIntern.add(intern);
                    
            
                }
            startMonth++;
                    
            if(startMonth==13){
                startMonth=1;
                startYear++;
            }
            
        }
        
        
    }
    upsert listIntern; //update   //upsert
    }
}