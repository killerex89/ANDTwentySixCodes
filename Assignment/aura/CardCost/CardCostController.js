({
    init: function (cmp, event, helper) {
    cmp.set('v.mycolumns', [
                {label: 'Card Replacement Cost', fieldName: 'Product__c', type: 'text'},
        		{label: 'Home Country', fieldName: 'Home_Country__c', type: 'text'},
        		{label: 'Fee', fieldName: 'HiddenCurrency2__c', type: 'text'}
            ]);
        
        helper.getData(cmp);
    }

})