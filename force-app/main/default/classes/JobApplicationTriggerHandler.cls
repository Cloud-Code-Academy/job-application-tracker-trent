public with sharing class JobApplicationTriggerHandler {
    
    //Method to run when the status of an application is changed
    public static void StatusChange (List <Job_Application__c> ApplicationRecords, Map <Id, Job_Application__c> OldVersion){
        List<Task> newTaskRecords = new List<Task>();

        //List of the Task Subject Lines for SAVED Status
        List<String> SubjectTitles = new List<String>{'Check if the job description aligns with your interests and values',
        'Review the highlighted skills to see if the role is a good fit',
        'Research the company or role and mark your excitement level'};

        //List of the Task Subject Lines for APPLYING Status
        List<String> SubjectApplying = new List<String>{'Find and research someone who works at the company and add them as a contact',
        'Set up an informational interview to learn more about the role/company',
        'Identify potential referrals to help get your application on the top of the pile', 
        'Customize your work achievements using the job description keywords', 'Submit your application on the company website if possible'};

        //List of the Task Subject Lines for APPLIED Status
        List<String> SubjectApplied = new List<String>{'Reach out to the hiring manager or recruiter', 'Follow up on your application via email weekly',
        'Continue identifying and saving similar job opportunities',
        'Set up weekly networking calls to explore similar companies/roles'};

        //List of the Task Subject Lines for INTERVIEWING Status
        List<String> SubjectInterviewing = new List<String>{'Prepare your blurb or “tell me about yourself” response', 'Practice answering behavioral interview questions', 'Research the company and your interviewers',
        'Set up your virtual interview space and test your tech',
        'Send thank you emails within 24 hours'};

        //List of the Task Subject Lines for NEGOTIATING Status
        List<String> SubjectNegotiating= new List<String>{'Research your market value and know your numbers',
        'Prepare your negotiation scripts',
        'Evaluate your offer and decline or accept'};

        //List of the Task Subject Lines for ACCEPTED Status
        List<String> SubjectAccepted= new List<String>{'Plan your resignation if applicable', 'Take some time to relax and recharge',
        'Prepare for your first day of onboarding'};

        //List of the Task Subject Lines for CLOSED Status
        List<String> SubjectClosed= new List<String>{'Send a follow-up email thanking the interviewer and asking for feedback',
        'Review your notes and reflect on areas of improvement'};

        for(Job_Application__c JobAPP : ApplicationRecords){
            if(JobAPP.Status__c != OldVersion.get(JobApp.Id).Status__c){

                //If Status is changed and the new value equals Saved, then create the task records
                if(JobApp.Status__c == 'SAVED'){
                    for (String subject : SubjectTitles){
                     Task newTask = new Task();
                     newTask.WhatId = JobApp.Id;
                     newTask.OwnerId = JobAPP.OwnerId;
                     newTask.Subject = subject;
                     newTask.ActivityDate = date.Today().addDays(7);
                     newTask.Priority = 'High';
                     newTask.Description = newTask.Subject + ' ' + 'Due:' + ' ' + newTask.ActivityDate;
                     
                     newTaskRecords.add(newTask);
                }

                //If Status is changed and the new value equals Applying, then create the task records
                } else if (JobApp.Status__c == 'Applying'){
                    for (String subject : SubjectApplying){
                     Task newTask = new Task();
                     newTask.WhatId = JobApp.Id;
                     newTask.OwnerId = JobAPP.OwnerId;
                     newTask.Subject = subject;
                     newTask.ActivityDate = date.Today().addDays(7);
                     newTask.Priority = 'High';
                     newTask.Description = newTask.Subject + ' ' + 'Due:' + ' ' + newTask.ActivityDate;

                     newTaskRecords.add(newTask);
    }
                //If Status is changed and the new value equals APPLIED, then create the task records
                } else if (JobApp.Status__c == 'Applied'){
                    for (String subject : SubjectApplied){
                    Task newTask = new Task();
                    newTask.WhatId = JobApp.Id;
                    newTask.OwnerId = JobAPP.OwnerId;
                    newTask.Subject = subject;
                    newTask.ActivityDate = date.Today().addDays(7);
                    newTask.Priority = 'High';
                    newTask.Description = newTask.Subject + ' ' + 'Due:' + ' ' +  newTask.ActivityDate;

                    newTaskRecords.add(newTask);
}
                //If Status is changed and the new value equals INTERVIEWING, then create the task records
                } else if (JobApp.Status__c == 'INTERVIEWING'){
                    for (String subject : SubjectInterviewing){
                    Task newTask = new Task();
                    newTask.WhatId = JobApp.Id;
                    newTask.OwnerId = JobAPP.OwnerId;
                    newTask.Subject = subject;
                    newTask.ActivityDate = date.Today().addDays(1);
                    newTask.Priority = 'High';
                    newTask.Description = newTask.Subject + ' ' + 'Due:' + ' ' +  newTask.ActivityDate;

                    newTaskRecords.add(newTask);
    
}               //If Status is changed and the new value equals NEGOTIATING, then create the task records
                } else if (JobApp.Status__c == 'NEGOTIATING'){
                    for (String subject : SubjectNegotiating){
                    Task newTask = new Task();
                    newTask.WhatId = JobApp.Id;
                    newTask.OwnerId = JobAPP.OwnerId;
                    newTask.Subject = subject;
                    newTask.ActivityDate = date.Today().addDays(7);
                    newTask.Priority = 'High';
                    newTask.Description = newTask.Subject + ' ' + 'Due:' + ' ' +  newTask.ActivityDate;

                    newTaskRecords.add(newTask);
}
                //If Status is changed and the new value equals ACCEPTED, then create the task records
                } else if (JobApp.Status__c == 'ACCEPTED'){
                    for (String subject : SubjectAccepted){
                    Task newTask = new Task();
                    newTask.WhatId = JobApp.Id;
                    newTask.OwnerId = JobAPP.OwnerId;
                    newTask.Subject = subject;
                    newTask.ActivityDate = date.Today().addDays(7);
                    newTask.Priority = 'High';
                    newTask.Description = newTask.Subject + ' ' + 'Due:' + ' ' +  newTask.ActivityDate;

                    newTaskRecords.add(newTask);
}
                //If Status is changed and the new value equals CLOSED, then create the task records
                }  else if (JobApp.Status__c == 'CLOSED'){
                    for (String subject : SubjectClosed){
                    Task newTask = new Task();
                    newTask.WhatId = JobApp.Id;
                    newTask.OwnerId = JobAPP.OwnerId;
                    newTask.Subject = subject;
                    newTask.ActivityDate = date.Today().addDays(7);
                    newTask.Priority = 'High';
                    newTask.Description = newTask.Subject + ' ' + 'Due:' + ' ' +  newTask.ActivityDate;

                    newTaskRecords.add(newTask);
    }
}

            }
        }           //Commit Records with the insert key
                    insert newTaskRecords;
    }
    //Method to run when application is created or updated
    public static void PrimaryContact(List<Job_Application__c> applicationRecords) {
        System.debug('PrimaryContact method has started.');
    
        // Get Related Contacts
        List<Contact> relatedContacts = [
            SELECT Id, Name, Job_Application__c 
            FROM Contact 
            WHERE Job_Application__c IN :applicationRecords
        ];
    
        System.debug('Related Contacts: ' + relatedContacts);
    
        // Map to store the related contacts (Many) by Job Application ID
        Map<Id, List<Contact>> contactsByJobAppId = new Map<Id, List<Contact>>();
    
        // Populate the map with contacts grouped by Job Application ID
        for (Contact contact : relatedContacts) {
            //check if the Job_Application__c ID already exists as a key in the map. If not, instantiate a new list for that key.
            if (!contactsByJobAppId.containsKey(contact.Job_Application__c)) {
                contactsByJobAppId.put(contact.Job_Application__c, new List<Contact>());
            }
            //adds the Contact record to the list associated with the Job_Application__c ID.
            contactsByJobAppId.get(contact.Job_Application__c).add(contact); // Correct usage
        }
    
        // Iterate through each Job Application record to check and assign primary contact
        for (Job_Application__c jobApp : applicationRecords) {
            //check if a primary contact exists for the current job application, if so, primaryContactExists = True
            Boolean primaryContactExists = (jobApp.Primary_Contact__c != null);
            List<Contact> jobAppContacts = contactsByJobAppId.get(jobApp.Id);
    
            System.debug('Job Application ID: ' + jobApp.Id);
            System.debug('Primary Contact Exists: ' + primaryContactExists);
            System.debug('Related Contacts: ' + jobAppContacts);
    
            if (!primaryContactExists && jobAppContacts != null && !jobAppContacts.isEmpty()) {
                jobApp.Primary_Contact__c = jobAppContacts[0].Id;
                System.debug('Assigned Primary Contact ID: ' + jobAppContacts[0].Id);
            }
        }
        System.debug('Exiting PrimaryContact method.');
    }
}
    