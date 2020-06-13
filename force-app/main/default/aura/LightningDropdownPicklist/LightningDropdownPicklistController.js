({
    onChange: function (component, event, helper) {
        var searchValue = component.find('select').get('v.value');
        var action =component.get('c.fetchAccounts');
        action.setParams({
            searchParam : searchValue
        });
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state === 'SUCCESS'){
                var responseValue =response.getReturnValue();
                console.log('responseValue', responseValue);
                component.set('v.dataList',responseValue);
            }else{
                console.log(response.getError())
            }
        });
        $A.enqueueAction(action);
    }
})