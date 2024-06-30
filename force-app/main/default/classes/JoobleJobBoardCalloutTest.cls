@isTest
private class JoobleJobBoardCalloutTest {
 
    @isTest
    static void testJoobleJobBoardCallout() {
        // Use the JoobleJobBoardCalloutMock class to fake a response
        Test.setMock(HttpCalloutMock.class, new JoobleJobBoardCalloutMock());
        
        // Call the method that performs a callout
        Test.startTest();
        JoobleJobBoardCallout.getJobBoardListings();
        Test.stopTest();

        // Query for the Job_Application__c records that should have been created
        List<Job_Application__c> createdJobs = [SELECT Id, Name, Salary__c, Location__c, URL__c, Status__c, Job_Title__c, Description__c FROM Job_Application__c];
        
        // Assert that jobs were created
        System.assertNotEquals(0, createdJobs.size(), 'Job applications should have been created');
        
        // Add more assertions to verify the data in the created job applications
        Job_Application__c job = createdJobs[0];
        System.assertEquals('Test Company', job.Name);
        System.assertEquals('100000', job.Salary__c);
        System.assertEquals('http://test.com', job.URL__c);
        System.assertEquals('Saved', job.Status__c);
        System.assertEquals('Test Job', job.Job_Title__c);
        System.assertEquals('Test Description', job.Description__c);
    }
}