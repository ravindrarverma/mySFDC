({
    createModal : function(component, event, helper) {
        component.find('overlayLib').showCustomModal({
            header: "Application Confirmation",
            body: 'This is test',
            footer:'Footer',
            showCloseButton: true,
            closeCallback: function() {
                alert('You closed the alert!');
            }
        });
    },
    navigateURL : function(component, event, helper) {
        var pageReference = component.find("navigation");
        var pageReferenceNav = {
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Account',
                actionName: 'list'
            },
            state: {
                filterName: "MyAccounts"
            }
        };
        pageReference.navigate(pageReferenceNav);
    },
    handleLoad :function(component, event, helper){
        
    },
    handleSubmit : function(component, event, helper){
        alert(' Submit handled');
    },
    handleSuccess : function(component, event, helper){
        
    },
    createButton : function(component, event, helper){
        $A.createComponent('lightning:button',
                           {
                               label :"Create New " ,
                               value :"Create New ",
                               onclick :component.getReference("c.handleSubmit")
                           },function(newbutton ,status ,errorMessage){
                               if(status=== 'SUCCESS'){
                                   alert('Button Create Successfully');
                               var body = component.get('v.body');
                                   body.push(newbutton);
                                   component.set('v.body',body);
                               }
                           });
    },
    
})