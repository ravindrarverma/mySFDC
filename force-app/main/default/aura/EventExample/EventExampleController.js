({
	doChange : function(component, event, helper) {
		alert('value changed');
	},
    Changevalue : function(component, event, helper) {
        component.set('v.test','Test');
    },
    doInit : function(component, event, helper) {
        component.set('v.test','On Init');
    }
})