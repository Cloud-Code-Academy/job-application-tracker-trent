@isTest
private class JoobleJobBoardCalloutTest {
 
    @isTest
    static void testJoobleJobBoardCallout() {
        // Use the JoobleJobBoardCalloutMock class to fake a response
        Test.setMock(HttpCalloutMock.class, new JoobleJobBoardCalloutMock());
        
        // Call the method that performs a callout
        Test.startTest();
        HttpResponse response = JoobleJobBoardCallout.getJobBoardListings();
        Test.stopTest();

        // Assert that the response was 200
        System.assertEquals(200, response.getStatusCode(), 'Expected status code 200, but got ' + response.getStatusCode());
    }
}