({
	myAction : function(component, event, helper) {
        var action = component.get("c.getAccounts");//c denotes controller
        console.log(action);
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
               component.set("v.wrapList",response.getReturnValue());//v is variable
                
            }
        });
        $A.enqueueAction(action); 
		
	}
})