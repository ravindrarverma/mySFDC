({
    press : function(cmp, event, helper) {
        //set the child component value.
        alert("i am component B Controller before cmp.set");
        cmp.set('v.myString','Hello World');
        alert("i am component B Controller Before declare variable var vx");
        
        var vx = cmp.get("v.method");
        alert("i am component B Controller before enqueueAction");
        
        //fire event from child and capture in parent
        $A.enqueueAction(vx);
    }
})