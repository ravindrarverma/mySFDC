public class Hierarchy{
    
    //List of items to be displayed in hierarchy
    public List<hierarchyItem> hierarchyItemList {get;set;}
    
    //map of all  hierarchy records related to for a account for which we are showing hierarchy
    private Map<Id , Hierarchy__c> mapHierarchy = new Map<Id , Hierarchy__c>();
    
    //Hierarchy Index, used to determine spaces before the name starts
    private static Integer hirarchyIndex = 0;
    
    //name of account for which hierarchy is created
    public String AccountName {get;set;}
    
    public hierarchy()
    {
        if(ApexPages.currentPage().getParameters().get('accountid') != null)
        {
            ID AccountID = ApexPages.currentPage().getParameters().get('accountid');
            
            AccountName = [Select Name From Account where id =: AccountID].Name;
            //Get all hierarchy records related to account
            mapHierarchy = new Map<Id , Hierarchy__c>([Select Name , Parent_Hierarchy__c  From Hierarchy__c Where AccountId__c =: AccountID]);
            
            
            
            List<Hierarchy> listParentHierarchy = new List<Hierarchy>();
            hierarchyItemList = new List<hierarchyItem>();
            
            for(Hierarchy__c h : mapHierarchy.values())
            {
                if(h.Parent_Hierarchy__c  == null)
                {
                    hierarchyItemList.add(new hierarchyItem( h.Name , 0));
                    mapHierarchy.remove(h.id);
                    hierarchyItemList = getChildHierarchy(h.id , hierarchyItemList);
                }
                
            }
        }
    }
    
    //Method to get child records
    private List<hierarchyItem> getChildHierarchy(Id parentId , List<hierarchyItem> currentHierarchyItemList)
    {
        hirarchyIndex = hirarchyIndex + 1;
        for(Hierarchy__c h : mapHierarchy.values())
        {
            if(h.Parent_Hierarchy__c == parentId)
            {
                hierarchyItemList.add(new hierarchyItem( h.Name , hirarchyIndex));
                mapHierarchy.remove(h.id);
                //Get child records of child
                hierarchyItemList = getChildHierarchy(h.id , hierarchyItemList);
            }
            
        }
        hirarchyIndex = hirarchyIndex - 1;    
        return currentHierarchyItemList;    
    }    
    
    //Inner class for maintaing hierarchy items
    public class hierarchyItem{
        
        public String itemValue{get;set;} 
        public String hirarchyIndexNo{get;set;}
        public hierarchyItem(String itemValue , Integer hirarchyIndexNo)
        {
            String spaceCount = '';
            for(integer i = 0 ; i < hirarchyIndexNo ; i++)
                spaceCount = spaceCount  + '&nbsp;&nbsp;';
            
            this.itemValue = spaceCount + itemValue;
        }
    }
    
}