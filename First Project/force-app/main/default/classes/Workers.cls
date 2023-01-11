public class Workers { 
    
    public class course{ 
        
        public String name;
        public Integer session;
        public Integer studentNum;
        
        public course(String courseName){
            name = courseName;
        }
    }
    
    public String name;
    private Integer workingHours = 0;
    private Decimal income = 0;
    private Decimal expense = 0;
   
    
    public static Integer totalHours = 0;
	public static Decimal totalIncome = 0;
    public static Decimal totalExpense = 0;
    
    public workers(String workersName){ 
        system.debug('Constractor method is working...');
        name = workersName;
    }
    
    public void addHours(Integer howMany){
        workingHours += howMany;
        totalHours += howMany;
    }
    public void addIncome(Decimal incomeValue){
        income += incomeValue;
        totalIncome += incomeValue;
    }
    public void addExpense(Integer expenseValue){
        expense += expenseValue;
        totalExpense += expenseValue;
    }
    public Integer hours(){ 
        return workingHours;
    }
    public Decimal incomes(){ 
        return income;
    }
    public Decimal expenses(){
        return expense;
    }
}