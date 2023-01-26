public class AccountCreationSchedule implements Schedulable {
    public void execute(SchedulableContext SC){
        //code to execute
        Account acc = new Account();
        acc.Name = 'Clicked Scheduled';
        insert acc;
    }
}