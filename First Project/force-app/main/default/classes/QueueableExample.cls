public class QueueableExample implements Queueable {
    public void execute(QueueableContext context){
        //code to execute
        Account acc = new Account();
        acc.Name = 'Clicked';
        insert acc;
    }
}