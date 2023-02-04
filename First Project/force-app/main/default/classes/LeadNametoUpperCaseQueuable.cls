public class LeadNametoUpperCaseQueuable implements Queueable{
    public void execute(QueueableContext contex){
        List<Lead> lds=[SELECT id, FirstName, LastName FROM Lead];
        for(Lead ld:lds){
            ld.FirstName=ld.FirstName.toUpperCase();
            ld.LastName=ld.LastName.toUpperCase();
        }
        update lds;
    }
}