public with sharing class JoobleJobBoardCallout {

//Callout to Jooble - Post Method Tested with Postman
public Static HttpResponse getJobBoardListings(){
    
    HttpRequest request = new HttpRequest();
    request.setEndpoint('https://jooble.org/api/87d95f26-ffbb-4223-acb3-ae3ac5149922');
    request.setMethod('POST');
    request.setHeader('Content-Type', 'application/json');
    //This is where the JSON that hold values to be sent to Jooble is held (Same raw data as postman)
    request.setBody('{"keywords": "Salesforce Developer","Location": "Kansas City, Missouri", "Salary": "100000", "datecreatedfrom" : "2024-05-19"}');

    Http http = new Http();
    HttpResponse response = http.send(request);
    System.debug(response.getBody());
    System.debug(response.getStatusCode());
    System.debug(response.getStatus());

    if(response.getStatusCode() == 200){
        //run method to create application record
        Job_Application__c jA = createJobAppFromJson(response.getBody());
        system.debug(jA);
}
return response;
}
    //Deserialize Json and parse it
    private static Job_Application__c createJobAppFromJson(String jsonResponse) {
        //List for Bulk insert
        List<Job_Application__c> jobApplications = new List<Job_Application__c>();
        //Map of the keys and then the job objects
        Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(jsonResponse);
        //List to hold the job objects
        List<Object> jobsList = (List<Object>) jsonMap.get('jobs');


        //Create Job Application Record
        //Looping the jobs the adding them to the jobApplications List
        for (Object jobObj : jobsList) {
            Map<String, Object> jobMap = (Map<String, Object>) jobObj;

        Job_Application__c jA = new Job_Application__c();
        jA.Name = (String) jobMap.get('company');
        jA.Salary__c = (String) jobMap.get('salary');
        jA.Location__c = (String) jobMap.get('Location');
        jA.URL__c = (String) jobMap.get('link');
        jA.Status__c = 'Saved';
        jA.Job_Title__c = (String) jobMap.get('title');
        jA.Description__c = (String) jobMap.get('snippet');
        jobApplications.add(jA);
        

        system.debug(jsonMap);
        system.debug(jA.Salary__c);
        system.debug(jA.Location__c);
        system.debug(jA.URL__c);
        system.debug(jA.Status__c);
        system.debug(jA.Job_Title__c);
        system.debug(jA.Description__c);
        }
       
        //Insert Records
        insert jobApplications;
        return jobApplications[0];
}
}
