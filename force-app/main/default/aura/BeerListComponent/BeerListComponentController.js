({
    showInfo : function(component, event, helper) {
        var eventSource =event.getSource();
        //alert(eventSource.get('v.name'));
        var beerObj =eventSource.get('v.name');  /*Aura Component Overlay LibraryProvides methods to display messages*/
        console.log(beerObj);                    /*via modals and popovers.*/
        component.set('v.beerId',beerObj);       /* This component requires API version 41.0 and later.*/
        $A.createComponent(                      
               "c:BeerDetails", {
                "beerId" : beerObj
            },
            function(beerDetails ,status ,errorMessage){
                if(status=== 'SUCCESS'){
                    component.find('overLayLib').showCustomModal({
                        header: "Beer Details",
                        body: beerDetails,
                        footer:'Footer',
                        showCloseButton: true,
                        closeCallback: function() {
                            
                        }
                    }); 
                }else if (status === "INCOMPLETE"){
                    
                }else if (status === "ERROR"){
                    
                }
            }); 
    }
})