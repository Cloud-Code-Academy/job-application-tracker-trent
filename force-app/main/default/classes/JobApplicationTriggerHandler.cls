public with sharing class JobApplicationTriggerHandler {
    public static void StatusChange (List <Job_Application__c> ApplicationRecords, Map <Id, Job_Application__c> OldVersion){
        List<Task> newTaskRecords = new List<Task>();
        for(Job_Application__c JobAPP : ApplicationRecords){
            if(JobAPP.Status__c != OldVersion.get(JobApp.Id).Status__c){
                if(JobApp.Status__c == 'SAVED'){

                Task newTask = new Task();
                newTask.WhatId = JobApp.Id;
                newTask.OwnerId = JobAPP.OwnerId;
                newTask.Subject = 'Saved Job Application';
                newTask.ActivityDate = date.Today().addDays(7);
                newTask.Priority = 'High';

                newTaskRecords.add(newTask);
            
                }
            }
        }
                insert newTaskRecords;
    }
}

    
    