@isTest
private class CalendarValidationTest {
    @isTest
    static void CalendarDateCheckTestPositive() {
        DateTime commonStartTime = DateTime.now();
        
        // Create two events with the same start time
        Event testEvent1 = new Event(
            Subject = 'Test Event 1',
        StartDateTime = commonStartTime,
        EndDateTime = commonStartTime.addHours(1),
        OwnerId = '005aj000004nGNtAAM'
            );
        insert testEvent1;
        
        Test.startTest();
        //Create second event with the same start time
        Event testEvent2 = new Event(
            Subject = 'Test Event 2',
        StartDateTime = commonStartTime,
        EndDateTime = commonStartTime.addHours(1),
        OwnerId = '005aj000004nGNtAAM'
            );
        
        String errorMessage;
        
        //By using the try catch block, we are firing the Calendar Validation trigger which passes in trigger.new to the Calendar handler
        try{
            insert testEvent2;
        } catch (DmlException e){
            errorMessage = e.getDmlMessage(0);
        }
        Test.stopTest();
        
        // Positive Test
        Assert.areEqual('Make sure that Events do not start at the same time', errorMessage);
    }
    @isTest
    static void CalendarDateCheckTestNegative() {
        DateTime Tomorrow = Date.Today().adddays(1);
        
        // Create event number 1
        Event testEvent1 = new Event(
            Subject = 'Test Event 1',
        StartDateTime = Tomorrow,
        EndDateTime = Tomorrow,
        OwnerId = '005aj000004nGNtAAM'
            );
        insert testEvent1;
        
        Test.startTest();
        //Create second event with different start time
        Event testEvent2 = new Event(
            Subject = 'Test Event 2',
        StartDateTime = Date.Today(),
        EndDateTime = Date.Today(),
        OwnerId = '005aj000004nGNtAAM'
            );
        
        String errorMessage;
        
        //By using the try catch block, we are firing the Calendar Validation trigger which passes in trigger.new to the Calendar handler again
        try{
            insert testEvent2;
        } catch (DmlException e){
            errorMessage = e.getDmlMessage(0);
        }
        Test.stopTest();
        
        // Positive Test
        Assert.areNotEqual('Make sure that Events do not start at the same time', errorMessage);
    }
}