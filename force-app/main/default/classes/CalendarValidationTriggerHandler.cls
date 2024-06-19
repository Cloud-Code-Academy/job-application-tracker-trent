public with sharing class CalendarValidationTriggerHandler {
    public static void CalendarDateCheck(List<Event> EventRecords) {
       
            //1. Get the current Events

            List <Event> CurrentUserEvents = [Select Id, StartDateTime from Event where OwnerId = :UserInfo.getUserId()];
            //Have a set that can hold the dates from the Events
            Set <Datetime> EventDates = new set <Datetime>();

            //2. Put the Dates from the Events into the Set (Collection of StartDates)
            for(Event UserEvents : CurrentUserEvents){
            EventDates.add(UserEvents.StartDateTime);
            }

            //3. Check if the Set Contains the Date of the Current Event that is being created or updated
            for(Event Evt : EventRecords){
            
            if(EventDates.contains(Evt.StartDateTime)){
            //4. If Current Event Start Date is in the Set, display an adderror message to block the creation or update
                Evt.adderror('Make sure that Events do not start at the same time');
            }
        }

        
}
    }