({
    parentPress : function(cmp, event, helper) {
         
        var objChild = cmp.find('compB');
        alert("i am component A Controller");
        alert("Method Called from Child " + objChild.get('v.myString'));
    }
})