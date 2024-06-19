public with sharing class EmailReminderSchedule implements Schedulable {
    public void execute (SchedulableContext sc) {
        //run a method that does the logic here
        System.debug('Scheduled Job started');
        sendEmailReminder();
    }


    //Actual Method that runs the logic
    private static void sendEmailReminder(){

        //Variable to hold tomorrows Date
        Date tomorrow = Date.today().addDays(1);

        //Get Interview Events that are scheduled for Tomorrow
        List <Event> NextDayEvents = [Select Id, who.name, Subject, Owner.Email, StartDateTime from Event where StartDateTime = tomorrow];


        for(Event Evt : NextDayEvents ){
            //Create a Single Email for each Event
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setWhatId('a00aj00000BWuSAAA1');
            mail.setSubject('Reminder: Upcoming Event');
            mail.setPlainTextBody('This is a reminder for your upcoming event, which is tomorrow: ' + Evt.Subject + ' scheduled at ' + EVt.StartDateTime + '.' + 
            'The interview is with' + Evt.Who.Name);
            mail.setToAddresses(new String[] {Evt.Owner.Email}); // Replace with actual recipient email address
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });

        }
    }
}