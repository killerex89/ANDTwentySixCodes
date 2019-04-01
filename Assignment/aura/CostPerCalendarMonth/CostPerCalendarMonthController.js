({
    init: function (cmp, event, helper) {
    cmp.set('v.mycolumns', [
                {label: 'Cost Per Calender Month', fieldName: 'Product__c', type: 'text'},
        		{label: 'Home Country', fieldName: 'Home_Country__c', type: 'text'},
        		{label: 'Fee', fieldName: 'HiddenCurrency__c', type: 'text'}
            ]);
        
        helper.getData(cmp);
    }

})