global class BatchEmail implements Database.Batchable<sObject> { 
 global String query; 
 
 global Database.QueryLocator start(Database.BatchableContext bc){ 
 Date PositionDate = Date.today().addDays(-2); 
 query = 'select id, name, status__c, owner.email, date_opened__c from position__c where date_opened__c < :PositionDate'; 
 
 return Database.getQueryLocator(query); 
 } 
 
 global void execute(Database.BatchableContext bc, List<Position__c> batch){ 
 List<String> emails = new List<String>(); 
 for(Position__c pos : batch){ 
 if(pos.owner.email != null){emails.add(pos.owner.email);} 
 } 
 
 Messaging.SingleEmailMessage msg = new Messaging.SingleEmailMessage(); 
 
 msg.setToaddresses(emails); 
 msg.setSubject('Important - Position still Open!!'); 
 msg.setHtmlBody('Hi,<br/>The position created by you is still open. Kindly go through it once.'); 
 
 Messaging.sendEmail(new Messaging.SingleEmailMessage[]{msg}); 
 } 
 
 global void finish(Database.BatchableContext bc){ 
 
 } 
}