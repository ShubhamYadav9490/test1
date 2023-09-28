public class PositionSearchClass { 
 public List<Position__c> posList {get; set;} 
 public List<Position__c> results {get; set;} 
 public String sName {get; set;} 
 
 public PositionSearchClass(){ 
 posList = [select Name, department__c, Location__c, Status__c from Position__c]; 
 } 
 public List<Position__c> getAllPos(){ 
 return posList; 
 } 
 public PageReference searchMethod(){ 
 
 List<List<sObject>> search = [FIND :sName IN ALL FIELDS RETURNING Position__c(Name, 
Department__c, Location__c, Status__c)]; 
 results = new List<Position__c>(); 
 results = (List<Position__c>) search[0]; 
 
 return null; 
 } 
}