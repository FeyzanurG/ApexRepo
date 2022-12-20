public class Dinner {
    /*public Dinner() {
    } this is constractor method, automatically comes*/
    public Integer numberOfJuices;
    public String mealName;
	
    public Dinner(){
        numberOfJuices = 2;
        mealName = 'Pizza';
    }
    public Dinner (String otherMeal, Integer newNumberOfJuices){
        numberOfJuices = newNumberOfJuices;
        mealName = otherMeal;
    }
    public Dinner(String otherMeal, Integer newNumberOfJuices, Integer afterDinnerNumberOfJuices){
        numberOfJuices = newNumberOfJuices + afterDinnerNumberOfJuices;
         mealName = otherMeal;
        
    }
    public void DinnerMethod(){
        System.debug('I ate ' + mealName + ' and drunk ' + numberOfJuices + ' glass of juice');
    }
}