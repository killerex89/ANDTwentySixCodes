public class getContactController{
    @AuraEnabled
    public static wrapperClass getCases(Id key){
        
        wrapperClass returnwrapperClass = new wrapperClass();
        
        returnwrapperClass.lstContact = [SELECT Id, Subject, Type, ContactId, Contact.Product__c, Contact.Home_Country__c FROM case where id=:key];
        
        for(Case caseloop : returnwrapperClass.lstContact )
        {
            string key2 = string.valueof(caseloop.ContactId);
            returnwrapperClass.lstCon = [Select Product__c, Home_Country__c, HiddenCurrency__c, HiddenCurrency2__c, HiddenPercent__c from Contact where id=:key2];    
        }
        return returnwrapperClass;
    }
    
    public class wrapperClass{
        @AuraEnabled public List<Case> lstContact{get;set;}
        @AuraEnabled public List<Contact> lstCon{get;set;}

    }
}