trigger CalendarValidation on Event (before insert, before update) {
    
    if (Trigger.isBefore){
        
        CalendarValidationTriggerHandler.CalendarDateCheck(Trigger.new); 
        }
        }
    
    