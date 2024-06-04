trigger JobApplicationTrigger on Job_Application__c (before insert, after update) {
if(Trigger.isAfter){
    if(Trigger.isUpdate){
        JobApplicationTriggerHandler.StatusChange(Trigger.new, Trigger.oldMap);
    }
}
}