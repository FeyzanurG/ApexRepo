import { LightningElement } from 'lwc';

export default class Lwc5 extends LightningElement {

    weight;
    height;
    result;
    calculation;

    handleInputChange1(event){
        this.weight = event.target.value;     
    }

    handleInputChange2(event){
        this.height = event.target.value;     
    }

    handleButtonClick(){
        this.calculation = this.weight / ((this.height)*(this.height));

        if(this.calculation<19){
            this.result = "Underweight";
        } else if(this.calculation>=19 && this.calculation<25){
            this.result = "Healthy Weight";
        } else if(this.calculation>=25 && this.calculation<30){
            this.result = "Over Weight";
        } else{
            this.result = "Above Obesity";
        }
    }
}
     /*
Pounds and inches	
Formula: weight (lb) / [height (in)]2 x 703
9:06
Kilograms and meters (or centimeters)	
Formula: weight (kg) / [height (m)]2
*/