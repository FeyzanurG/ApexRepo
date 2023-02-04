public class LeadHandler {
	//Duplicate
    public static void beforeInsert(List<Lead> ldList){
        for(lead ld:ldList){
        List<Lead> lds=[SELECT id, LastName, Company FROM Lead WHERE LastName=:ld.LastName AND Company=:ld.Company];
        if(lds.size()>0){
            ld.LastName.addError('You cannot create a duplicate lead');
    }
        }}
// task creation for insert
public static void afterInsert(List<Lead> ldList){
    List<Task> taskList = new List <Task>();
    if(trigger.isInsert && trigger.isAfter){
        for(lead ld:ldList){
            if(ld.AnnualRevenue >=1000000){
                taskList.add(new Task(Subject= 'Follow Up VipLead Insert Task', WhoId = ld.id));
                if(taskList.size()>0) {
                    Insert taskList;
                }}}}}
    
    // task creation for update
 public static void afterUpdate(List<Lead> ldList){ 
      List<Task> taskList = new List <Task>();
                if(trigger.isUpdate && trigger.isAfter){
            for(lead ld:ldList){
                if(ld.AnnualRevenue >= 1000000){
                    taskList.add(new Task(Subject='Follow Up VipLead Update Task', WhoId = ld.id));
                    if(taskList.size()>0) {
                    Insert taskList;
                    }}}}}
}