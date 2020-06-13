({
    handleComponentEvent : function(component, event, helper) {
        var msg = event.getParam("message");
        component.set("v.messageFromEvent", msg);
         var numEventsHandled = parseInt(component.get("v.numEvents")) + 1;
    component.set("v.numEvents", numEventsHandled);
    }
})