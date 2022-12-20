public class Dinner {
    /*public Dinner() {
    } this is constractor method, automatically comes*/
    public Integer numberOfJuices;
    public String mealName;
	
    public dinner(){
        numberOfJuices = 2;
        mealName = 'Pizza';
    }
    public dinner (String otherMeal, Integer newNumberOfJuices){
        numberOfJuices = newNumberOfJuices;
        mealName = otherMeal;
    }
    public dinner(String otherMeal, Integer newNumberOfJuices, Integer afterDinnerNumberOfJuices){
        numberOfJuices = newNumberOfJuices + afterDinnerNumberOfJuices;
         mealName = otherMeal;
        
    }
    public void dinnerMethod(){
        System.debug('I ate ' + mealName + ' and drunk ' + numberOfJuices + ' glass of juice');
    }
}