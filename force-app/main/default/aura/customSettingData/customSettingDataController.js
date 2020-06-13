({
    doInit : function(component, event, helper) {
        var action = component.get("c.getCustomData");
        action.setCallback(this, function(response){
            var state =response.getState();
            if(state=== "SUCCESS"){
                var resposevalue =response.getReturnValue();
                component.set("v.customsettingList",resposevalue);
                console.log("resposevalue" +resposevalue);
                
            }
        });
        $A.enqueueAction(action);
        
    }
})