public with sharing class JobApplicationStatusSchedule implements Schedulable {
    public void execute (SchedulableContext sc) {
        //Run batch class
        StaleJobsApplications batch = new StaleJobsApplications();
        Database.executeBatch(batch);
        
        }
    }