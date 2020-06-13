({
    doInit : function(component, event, helper) {
        /* First */
        var action=component.get('c.getContactList');
        /* Optional */ /* second */
        action.setParams({
            accountId :component.get('v.recordId'),
        });
        /* four */
        action.setCallback(this,function(response){
               var responseValue=response.getReturnValue();
             console.log('responseValue',responseValue);
            component.set('v.contactList',responseValue);
         },'SUCCESS')
        /* three */
    $A.enqueueAction(action);
    },
    doRedirect :function(component, event, helper) {
    var eventSource = event.getSource();
    var id = eventSource.get('v.name');
    //alert(id);
        var navEvt =$A.get("e.force:navigateToSObject");
        navEvt.setParams({
            "recordId":id,
            "slideDevName":"detail"
        });
    navEvt.fire();
},
    handleCompEvent :function(component, event, helper){
        //alert("test")
       var availableContact = component.get('v.contactList');
       var ContactRecord = event.getParam('ContactRecord');
        console.log(ContactRecord)
        availableContact.push(ContactRecord);
        component.set('v.contactList',availableContact);
    }
})