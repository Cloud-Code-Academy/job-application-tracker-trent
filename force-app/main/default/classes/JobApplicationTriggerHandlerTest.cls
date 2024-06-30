@istest
private class JobApplicationTriggerHandlerTest {
    
    //Begin Changing the status Values to make sure that Tasks are created correctly
    @istest
    static void testJobApplicationStatusUpdatesSAVED() {
        
        //Create a Test Application to Use
        Job_Application__c jATestRecord = new Job_Application__c();
        jATestRecord.Name = 'Test Application 1';
        jATestRecord.Status__c = '';
        
        insert jATestRecord;
        String intialValue = jATestRecord.Status__c;
        
        //Put the Value into a Map
        Map <Id, Job_Application__c> originalApplicationRecords = new Map <Id, Job_Application__c>();
        originalApplicationRecords.put(jATestRecord.Id,jATestRecord);
        
        //Update Job Application
        jATestRecord.Status__c = 'Saved';
        update jATestRecord;
        
        //Get the Updated Record
        List <Job_Application__c> updatedApplicationRecord = new List <Job_Application__c>();
        updatedApplicationRecord.add(jATestRecord);
        
        //Pass the Updated Record and the Old version of the record into the Handler Class Method
        Test.startTest();
        JobApplicationTriggerHandler.StatusChange(updatedApplicationRecord,originalApplicationRecords);
        Test.stopTest();
        
        //If the updated record is different than the original record Status, the handler will create a task
        //Get the Task that was created
        List <Task> createdTaskRecord = [Select Id, subject from Task where Subject = 'Check if the job description aligns with your interests and values' Limit 1];
        
        //Assert that task was created
        Assert.areEqual(1, createdTaskRecord.size());
        
    }
    
    //Change Status Value to APPLYING
    @istest
    static void testJobApplicationStatusUpdatesAPPLYING(){
        
        //Create a Test Application to Use
        Job_Application__c jATestRecord = new Job_Application__c();
        jATestRecord.Name = 'Test Application 1';
        jATestRecord.Status__c = '';
        
        insert jATestRecord;
        String intialValue = jATestRecord.Status__c;
        
        //Put the Value into a Map
        Map <Id, Job_Application__c> originalApplicationRecords = new Map <Id, Job_Application__c>();
        originalApplicationRecords.put(jATestRecord.Id,jATestRecord);
        
        //Update Job Application
        jATestRecord.Status__c = 'Applying';
        update jATestRecord;
        
        //Get the Updated Record
        List <Job_Application__c> updatedApplicationRecord = new List <Job_Application__c>();
        updatedApplicationRecord.add(jATestRecord);
        
        //Pass the Updated Record and the Old version of the record into the Handler Class Method
        Test.startTest();
        JobApplicationTriggerHandler.StatusChange(updatedApplicationRecord,originalApplicationRecords);
        Test.stopTest();
        
        //If the updated record is different than the original record Status, the handler will create a task
        //Get the Task that was created
        List <Task> createdTaskRecord = [Select Id, subject from Task where Subject = 'Find and research someone who works at the company and add them as a contact' Limit 1];
        
        //Assert that task was created
        Assert.areEqual(1, createdTaskRecord.size());
        
    }
    
    //Change Status Value to APPLIED
    @istest
    static void testJobApplicationStatusUpdatesAPPLIED() {
        //Create a Test Application to Use
        Job_Application__c jATestRecord = new Job_Application__c();
        jATestRecord.Name = 'Test Application 1';
        jATestRecord.Status__c = '';
        
        insert jATestRecord;
        String intialValue = jATestRecord.Status__c;
        
        //Put the Value into a Map
        Map <Id, Job_Application__c> originalApplicationRecords = new Map <Id, Job_Application__c>();
        originalApplicationRecords.put(jATestRecord.Id,jATestRecord);
        
        //Update Job Application
        jATestRecord.Status__c = 'Applied';
        update jATestRecord;
        
        //Get the Updated Record
        List <Job_Application__c> updatedApplicationRecord = new List <Job_Application__c>();
        updatedApplicationRecord.add(jATestRecord);
        
        //Pass the Updated Record and the Old version of the record into the Handler Class Method
        Test.startTest();
        JobApplicationTriggerHandler.StatusChange(updatedApplicationRecord,originalApplicationRecords);
        Test.stopTest();
        
        //If the updated record is different than the original record Status, the handler will create a task
        //Get the Task that was created
        List <Task> createdTaskRecord = [Select Id, subject from Task where Subject = 'Reach out to the hiring manager or recruiter' Limit 1];
        
        //Assert that task was created
        Assert.areEqual(1, createdTaskRecord.size());
        
    }
    
    //Change Status Value to INTERVIEWING
    @istest
    static void testJobApplicationStatusUpdatesINTERVIEWING() {
        //Create a Test Application to Use
        Job_Application__c jATestRecord = new Job_Application__c();
        jATestRecord.Name = 'Test Application 1';
        jATestRecord.Status__c = '';
        
        insert jATestRecord;
        String intialValue = jATestRecord.Status__c;
        
        //Put the Value into a Map
        Map <Id, Job_Application__c> originalApplicationRecords = new Map <Id, Job_Application__c>();
        originalApplicationRecords.put(jATestRecord.Id,jATestRecord);
        
        //Update Job Application
        jATestRecord.Status__c = 'Interviewing';
        update jATestRecord;
        
        //Get the Updated Record
        List <Job_Application__c> updatedApplicationRecord = new List <Job_Application__c>();
        updatedApplicationRecord.add(jATestRecord);
        
        //Pass the Updated Record and the Old version of the record into the Handler Class Method
        Test.startTest();
        JobApplicationTriggerHandler.StatusChange(updatedApplicationRecord,originalApplicationRecords);
        Test.stopTest();
        
        //If the updated record is different than the original record Status, the handler will create a task
        //Get the Task that was created
        List <Task> createdTaskRecord = [Select Id, subject from Task where Subject = 'Prepare your blurb or “tell me about yourself” response' Limit 1];
        
        //Assert that task was created
        Assert.areEqual(1, createdTaskRecord.size());
        
    }
    
    //Change Status Value to NEGOTIATING
    @istest
    static void testJobApplicationStatusUpdatesNEGOTIATING() {
        //Create a Test Application to Use
        Job_Application__c jATestRecord = new Job_Application__c();
        jATestRecord.Name = 'Test Application 1';
        jATestRecord.Status__c = '';
        
        insert jATestRecord;
        String intialValue = jATestRecord.Status__c;
        
        //Put the Value into a Map
        Map <Id, Job_Application__c> originalApplicationRecords = new Map <Id, Job_Application__c>();
        originalApplicationRecords.put(jATestRecord.Id,jATestRecord);
        
        //Update Job Application
        jATestRecord.Status__c = 'Negotiation';
        update jATestRecord;
        
        //Get the Updated Record
        List <Job_Application__c> updatedApplicationRecord = new List <Job_Application__c>();
        updatedApplicationRecord.add(jATestRecord);
        
        //Pass the Updated Record and the Old version of the record into the Handler Class Method
        Test.startTest();
        JobApplicationTriggerHandler.StatusChange(updatedApplicationRecord,originalApplicationRecords);
        Test.stopTest();
        
        //If the updated record is different than the original record Status, the handler will create a task
        //Get the Task that was created
        List <Task> createdTaskRecord = [Select Id, subject from Task where Subject = 'Research your market value and know your numbers' Limit 1];
        
        //Assert that task was created
        Assert.areEqual(1, createdTaskRecord.size());
        
    }
    
    //Change Status Value to ACCEPTED
    @istest
    static void testJobApplicationStatusUpdatesACCEPTED() {
        //Create a Test Application to Use
        Job_Application__c jATestRecord = new Job_Application__c();
        jATestRecord.Name = 'Test Application 1';
        jATestRecord.Status__c = '';
        
        insert jATestRecord;
        String intialValue = jATestRecord.Status__c;
        
        //Put the Value into a Map
        Map <Id, Job_Application__c> originalApplicationRecords = new Map <Id, Job_Application__c>();
        originalApplicationRecords.put(jATestRecord.Id,jATestRecord);
        
        //Update Job Application
        jATestRecord.Status__c = 'ACCEPTED';
        update jATestRecord;
        
        //Get the Updated Record
        List <Job_Application__c> updatedApplicationRecord = new List <Job_Application__c>();
        updatedApplicationRecord.add(jATestRecord);
        
        //Pass the Updated Record and the Old version of the record into the Handler Class Method
        Test.startTest();
        JobApplicationTriggerHandler.StatusChange(updatedApplicationRecord,originalApplicationRecords);
        Test.stopTest();
        
        //If the updated record is different than the original record Status, the handler will create a task
        //Get the Task that was created
        List <Task> createdTaskRecord = [Select Id, subject from Task where Subject = 'Plan your resignation if applicable' Limit 1];
        
        //Assert that task was created
        Assert.areEqual(1, createdTaskRecord.size());
        
    }
    
    //Change Status Value to CLOSED
    @istest
    static void testJobApplicationStatusUpdatesClosed(){
        //Create a Test Application to Use
        Job_Application__c jATestRecord = new Job_Application__c();
        jATestRecord.Name = 'Test Application 1';
        jATestRecord.Status__c = '';
        
        insert jATestRecord;
        String intialValue = jATestRecord.Status__c;
        
        //Put the Value into a Map
        Map <Id, Job_Application__c> originalApplicationRecords = new Map <Id, Job_Application__c>();
        originalApplicationRecords.put(jATestRecord.Id,jATestRecord);
        
        //Update Job Application
        jATestRecord.Status__c = 'CLOSED';
        update jATestRecord;
        
        //Get the Updated Record
        List <Job_Application__c> updatedApplicationRecord = new List <Job_Application__c>();
        updatedApplicationRecord.add(jATestRecord);
        
        //Pass the Updated Record and the Old version of the record into the Handler Class Method
        Test.startTest();
        JobApplicationTriggerHandler.StatusChange(updatedApplicationRecord,originalApplicationRecords);
        Test.stopTest();
        
        //If the updated record is different than the original record Status, the handler will create a task
        //Get the Task that was created
        List <Task> createdTaskRecord = [Select Id, subject from Task where Subject = 'Send a follow-up email thanking the interviewer and asking for feedback' Limit 1];
        
        //Assert that task was created
        Assert.areEqual(1, createdTaskRecord.size());
        
    }
    
    //Perform a Negative test to make sure a task is not created
    @istest
    static void performNegativeTest(){
        //Create a Test Application to Use
        Job_Application__c jATestRecord = new Job_Application__c();
        jATestRecord.Name = 'Test Application 1';
        jATestRecord.Status__c = '';
        
        insert jATestRecord;
        String intialValue = jATestRecord.Status__c;
        
        //Put the Value into a Map
        Map <Id, Job_Application__c> originalApplicationRecords = new Map <Id, Job_Application__c>();
        originalApplicationRecords.put(jATestRecord.Id,jATestRecord);
        
        //Update Job Application but dont change the status value
        jATestRecord.Status__c = '';
        update jATestRecord;
        
        //Get the Updated Record
        List <Job_Application__c> updatedApplicationRecord = new List <Job_Application__c>();
        updatedApplicationRecord.add(jATestRecord);
        
        //Pass the Updated Record and the Old version of the record into the Handler Class Method
        Test.startTest();
        JobApplicationTriggerHandler.StatusChange(updatedApplicationRecord,originalApplicationRecords);
        Test.stopTest();
        
        //If the updated record is different than the original record Status, the handler will create a task
        //Get the Task that was created
        List <Task> createdTaskRecord = [Select Id, subject from Task where Subject = 'Send a follow-up email thanking the interviewer and asking for feedback' Limit 1];
        
        //Assert that task was NOT created
        Assert.areEqual(0, createdTaskRecord.size());
    }
}