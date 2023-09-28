public class GetReviews {
    @AuraEnabled
    public static List<Review__c> allR1(){
        return [select Id, Name, Interviewer__c, Job_Application__c, Overall_Review_Score__c, Position_Title__c, Candidate_Name__c,Core_Competencies__c,Core_Competencies_Comments__c,Leadership_Skills__c, Leadership_Skills_Comments__c,Experience__c,Experience_Comments__c,Recommend_for_Hire__c, Reason_Recommended__c from Review__c];
    }
}