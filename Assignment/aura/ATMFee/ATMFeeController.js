({
    init: function (cmp, event, helper) {
    cmp.set('v.mycolumns', [
                {label: 'ATM Fee in other currencies', fieldName: 'Product__c', type: 'text'},
        		{label: 'Home Country', fieldName: 'Home_Country__c', type: 'text'},
        		{label: 'Fee', fieldName: 'HiddenPercent__c', type: 'text'}
            ]);
        
        helper.getData(cmp);
    }

})