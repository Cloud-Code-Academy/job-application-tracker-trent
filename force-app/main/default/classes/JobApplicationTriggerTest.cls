@istest
private class JobApplicationTriggerTest {
    
    
    // Insert a Job Application record to make sure the Primary Contact Handler runs from the trigger
    @istest
    static void jobApplicationInsert() {

        
        //Insert an Application record
        Test.startTest();
        Job_Application__c jA = new Job_Application__c();
        jA.Name = 'Test Application';
        insert jA;
        Test.stopTest();

        //Create Contact record that is tied to a job Application
        Contact newContact = new Contact();
        newContact.FirstName = 'Trent';
        newContact.LastName = 'Bacon';
        newContact.Job_Application__c = jA.Id;
        insert newContact;

    }

     // Update a Job Application record to make sure the Primary Contact Handler runs from the trigger
     @istest
     static void jobApplicationUpdate() {
 
         
         //Insert an Application record
         Test.startTest();
         Job_Application__c jA = new Job_Application__c();
         jA.Name = 'Test Application';
         insert jA;
         Test.stopTest();
 
         //Create Contact record that is tied to a job Application
         Contact newContact = new Contact();
         newContact.FirstName = 'Trent';
         newContact.LastName = 'Bacon';
         newContact.Job_Application__c = jA.Id;
         insert newContact;

         //Update the Job Application and check if the Primary Contact was set
         jA.Rating__c = '1';
         update jA;

         //check if the Job Application now has a primary contact equal to the contact entered above
         Job_Application__c updatedJobApplication = [Select Id, Rating__c, 	Primary_Contact__c,  name from Job_Application__c where Id =:jA.Id];
         Assert.areEqual(updatedJobApplication.Rating__c, '1');
         Assert.areEqual(updatedJobApplication.Primary_Contact__c, newContact.Id);
 
     }

    // Update a Job Application but dont tie a job application to a contact record - Negative Test
    @istest
    static void jobApplicationInsertNegative() {
        
       //Insert an Application record
       Test.startTest();
       Job_Application__c jA = new Job_Application__c();
       jA.Name = 'Test Application';
       insert jA;
       Test.stopTest();

       //Create Contact record, but dont put a job application in the lookup field
       Contact newContact = new Contact();
       newContact.FirstName = 'Trent';
       newContact.LastName = 'Bacon';
       insert newContact;

       //Update the Job Application and check if the Primary Contact was set
       jA.Rating__c = '1';
       update jA;

       //check if the Job Application now has a primary contact equal to the contact entered above
       Job_Application__c updatedJobApplication = [Select Id, Rating__c, 	Primary_Contact__c,  name from Job_Application__c where Id =:jA.Id];
       Assert.areEqual(updatedJobApplication.Rating__c, '1');
       //Ensuring the Job Application Record does not have a primary contact since no contact is a child record
       Assert.areEqual(updatedJobApplication.Primary_Contact__c, null);

    }
    
    
}