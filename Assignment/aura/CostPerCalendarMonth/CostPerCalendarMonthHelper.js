({
    getData : function(cmp) {
        var arId = cmp.get("v.recordId");
		var action = cmp.get('c.getCases');
        action.setParams({"key":arId});
        action.setCallback(this, $A.getCallback(function (response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                cmp.set('v.mydata', response.getReturnValue());
            }
            else if (state === "ERROR") {
                var errors = response.getError();
                console.error(errors);
            }
        }));
        $A.enqueueAction(action);
    }
})