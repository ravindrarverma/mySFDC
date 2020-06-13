({
    doInit : function(component, event, helper) {
        var action = component.get("c.userDetails");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log('responseValue', response.getReturnValue());
               component.set("v.userDetailsList",response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    }
})