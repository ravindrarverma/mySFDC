({
	doClick : function(component, event, helper) {
		var childComp =component.find('childComp');
        childComp.child('i am from Parent Component');
	},
    doHandle : function(component, event, helper) {
        alert('i am in parent component');
    }
})