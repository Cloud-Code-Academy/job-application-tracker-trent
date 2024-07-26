@istest
private class staleJobsApplicationsTest {
    
    @istest
    static void execute() {
        //Run batch class
        StaleJobsApplications batch = new StaleJobsApplications();
        Database.executeBatch(batch);
        
}
}