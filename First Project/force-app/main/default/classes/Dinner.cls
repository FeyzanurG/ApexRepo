public class Dinner {
    /*public Dinner() {
    } this is constractor method, automatically comes*/
    /* If the class name and method name is the same, it is called
    constractor method */
    public Integer numberOfJuices;
    public String mealName;
	
    public dinner(){
        numberOfJuices = 2;
        mealName = 'Pizza'; //constractor method
    }
    public dinner (String otherMeal, Integer newNumberOfJuices){
        numberOfJuices = newNumberOfJuices;
        mealName = otherMeal; //constractor method
    }
    public dinner(String otherMeal, Integer newNumberOfJuices, Integer afterDinnerNumberOfJuices){
        numberOfJuices = newNumberOfJuices + afterDinnerNumberOfJuices;
         mealName = otherMeal; //constractor method
        
    }
    public void dinnerMethod(){
        System.debug('I ate ' + mealName + ' and drunk ' + numberOfJuices + ' glass of juice');
    }
}