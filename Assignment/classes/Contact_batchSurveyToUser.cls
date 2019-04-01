global class Contact_batchSurveyToUser implements Database.Batchable<sObject> {
    
    global Database.QueryLocator start(Database.BatchableContext BC) {
        // collect the batches of records or objects to be passed to execute
         
        String query = 'SELECT language__c, survey_date__c FROM Contact where survey_date__c < today';
        return Database.getQueryLocator(query);
    }
     
    global void execute(Database.BatchableContext BC, List<Contact> conList) {
        
        EmailTemplate emailTemplate = [select Id, Body from EmailTemplate where DeveloperName = 'N26_Survey_to_Contact'];   
        
        List <Messaging.SingleEmailMessage > emailSend = new List < Messaging.SingleEmailMessage >();
        Map<Id,Messaging.SendEmailResult> targetToResultMap = new Map<Id,Messaging.SendEmailResult>();
        
        List <Contact> conToUpdate = new List<Contact>();
        List <Contact> conMassUpdate = new List<Contact>();
        
        for(Contact  ccc : conList) {
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setTargetObjectId(ccc.Id);
            email.setSaveAsActivity(false);
            email.setTemplateId(emailTemplate.Id);
            email.setWhatId(ccc.Id);
            emailSend.add(email);
        }
        
        system.debug('Check 2 : ' + emailSend);
        
        List<Messaging.SendEmailResult> sendEmailResults = Messaging.sendEmail(emailSend,false);        
        
        Integer i=0;
        if(sendEmailResults != null){
            for(Messaging.SendEmailResult sendEmailResult: sendEmailResults){
                if(sendEmailResult.isSuccess()){
                    targetToResultMap.put(emailSend.get(i).getTargetObjectId(),sendEmailResult);    
                    i++;
                }   
            }
        }
        
        system.debug('Check 3 : ' + targetToResultMap);
        
        if(targetToResultMap != null){
            for (Contact contactIterate : [Select id, survey_date__c from Contact where id in:targetToResultMap.keyset()]){
                contactIterate.survey_date__c = null;
                conMassUpdate.add(contactIterate);
            }
        }
        
        system.debug('Check 4 : ' + conMassUpdate);
        
        if(conMassUpdate != null){
            update conMassUpdate;
        }   
        
    }   
     
    global void finish(Database.BatchableContext BC) {
        // execute any post-processing operations
  }
}