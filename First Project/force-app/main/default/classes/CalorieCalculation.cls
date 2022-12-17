public with sharing class CalorieCalculation {
   
    public static Integer totalCalorie (Integer countSlices, Integer canOfSoftDrink){
    
    Integer totalCaloriCalculation = (countSlices * 285) + (canOfSoftDrink* 150);
    return totalCaloriCalculation;
    
    }
    
    
    }