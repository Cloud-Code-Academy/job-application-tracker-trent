@isTest
global class JoobleJobBoardCalloutMock implements HttpCalloutMock {
    // This method will be called when http.send(request) is invoked in the test
    global HTTPResponse respond(HTTPRequest request) {
// Create a new fake response
        HttpResponse response = new HttpResponse();
        // Set the Content-Type header to 'application/json' on the response
        response.setHeader('Content-Type', 'application/json');
         // Set a fake response body (the data we want to test with)
        response.setBody('{"jobs": [{"company": "Test Company", "salary": "100000", "location": "Test Location", "link": "http://test.com", "title": "Test Job", "snippet": "Test Description"}]}');
        // Set a fake status code on the response
        response.setStatusCode(200);
         // Return the response
        return response;
    }
}