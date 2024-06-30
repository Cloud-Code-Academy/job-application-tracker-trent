public with sharing class StaleJobsApplications implements Database.Batchable<sObject>, Database.Stateful{
    
    public Map<String, Integer> recordInformation = new Map<String, Integer>{
        'TotalRecord' => 0,
        'TotalError' => 0,
        'TotalSuccess' => 0
            
    };
    
    //Batch Start - Gets the Job Application records to be processed
    //where status is closed or accepted and Follow up date was more than 30 days ago
    public Database.QueryLocator start(Database.BatchableContext bc){
        system.debug('Batch has Started');
        return Database.getQueryLocator([
        SELECT Id, Name 
        FROM Job_Application__c
        WHERE (Status__c != 'Closed' AND Status__c != 'Accepted')
        AND Follow_up_date__c < :Date.today().addDays(-30)
]);
    }
    
    //Batch execute method that update the notes and the status field to closed
    public void execute (Database.BatchableContext bc, List<Job_Application__c> scope){
        system.debug('Batch execute method began');
        List<Job_Application__c> JobApps = new List <Job_Application__c>();
        //Set the Job Application Status's to Closed
        for(Job_Application__c JA : scope){
            JA.Status__c = 'Closed';
            JA.Notes__c = 'This was updated by an automated process - Batchable Class';
            JobApps.add(JA);
        }
        Update JobApps;
    }
    
    //Batch Finish method
    public void finish(Database.BatchableContext bc){
        system.debug('Batch finish method');
        //Do something
    }
    
    
    
}