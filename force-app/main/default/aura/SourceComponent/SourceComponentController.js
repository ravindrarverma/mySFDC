({
    executeEvent : function(component, event, helper) {
        var compEvent = component.getEvent('SourceComponent');
        compEvent.fire();
    }
})