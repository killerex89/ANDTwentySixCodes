@isTest

public class getContactController_Test{

    static testMethod void getContact(){
    
        Contact con = new Contact(FirstName= 'Test', LastName ='123', Email = 'test@gg.com', Home_Country__c='DE', Product__c ='Standard', Language__c ='de');
        insert con; 
        
        Case caselist = new Case(Origin = 'Email', ContactId= con.id, status = 'New');
        insert caselist;
    
        test.startTest();
        getContactController.getCases(caselist.id);
        test.stopTest();
        
    }

}