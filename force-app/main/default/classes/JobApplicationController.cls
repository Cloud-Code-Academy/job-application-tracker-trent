public with sharing class JobApplicationController {
    @AuraEnabled(cacheable=true)
    public static List<Job_Application__c> getJobApplications() {
        return [SELECT Id, Status__c, Job_Title__c, URL__c, Name FROM Job_Application__c where status__c = 'Saved'];
    }
}