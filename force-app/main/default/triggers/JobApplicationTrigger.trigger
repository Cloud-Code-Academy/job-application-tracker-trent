trigger JobApplicationTrigger on Job_Application__c (before insert, after update, before update) {
if(Trigger.isAfter){
    if(Trigger.isUpdate){
        JobApplicationTriggerHandler.StatusChange(Trigger.new, Trigger.oldMap);
    }
} else if (Trigger.isBefore){
    if(Trigger.isUpdate || Trigger.isInsert){
        JobApplicationTriggerHandler.PrimaryContact(Trigger.new); 
    }
    }
}
