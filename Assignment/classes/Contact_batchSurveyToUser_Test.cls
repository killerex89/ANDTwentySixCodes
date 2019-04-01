@isTest

public class Contact_batchSurveyToUser_Test{

    static testMethod void testbatch(){
    
    List<Contact> lstCon = new List<Contact>();
    for(Integer i=0; i < 10; i++){
    
        Contact con = new Contact();
        con.FirstName ='Test';
        con.LastName  ='Name'+i;
        con.Language__c = 'de';
        con.survey_date__c = System.today() - 2;
        lstCon.add(con);
    }
    insert lstCon;
    
    test.startTest();
    
    Contact_batchSurveyToUser obj = new Contact_batchSurveyToUser();
    Database.executebatch(obj);
    
    test.stopTest();
    
    
    }

}