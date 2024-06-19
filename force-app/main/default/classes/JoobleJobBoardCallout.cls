public with sharing class JoobleJobBoardCallout {

    //Callout to Jooble - Post Method Tested with Postman
    public Static Void getJobBoardListings(){
        
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://jooble.org/api/87d95f26-ffbb-4223-acb3-ae3ac5149922');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');
        //This is where the JSON that hold values to be sent to Jooble is held (Same raw data as postman)
        request.setBody('{"Keywords": "Salesforce Developer","Location": "Kansas City, Missouri", "Salary": "100000", "datecreatedfrom" : "2024-05-15"}');

        Http http = new Http();
        HttpResponse response = http.send(request);
        System.debug(response.getBody());
        System.debug(response.getStatusCode());
        System.debug(response.getStatus());

        if(response.getStatusCode() >= 200 || response.getStatusCode() <= 299){
            //Create Job Application Record From Jooble information
            system.debug(response.getBody());
            system.debug('Success');
            String formattedDate = String.valueOf(Date.today());
            formattedDate.remove(' 00:00:00');
            System.debug(formattedDate);
        }
}

        
    }
