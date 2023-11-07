import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-calculator',
  templateUrl: './calculator.component.html',
  styleUrls: ['./calculator.component.css']
})
export class CalculatorComponent implements OnInit {

  constructor() { }

  ngOnInit() {
  }


   num1="";
   num2="";
   sum="";
   subs="";
  

  calculateValNumb1(event:Event): string{

    return this.num1 = (<HTMLInputElement> event.target).value;
    
  }


  calculateValNumb2(event:Event):string{


    return this.num2 = (<HTMLInputElement> event.target).value;

  }
  

  sumResult(){

    const result_values = document.getElementById("result_values");

    let num1Value = parseInt(this.num1);
    let num2Value = parseInt(this.num2);

    let sumValue = num1Value+num2Value;
    result_values!.textContent = "Result: "+sumValue.toString();
    
     
  }

  subsResult(){

    const result_values = document.getElementById("result_values");
    let num1Value = parseInt(this.num1);
    let num2Value = parseInt(this.num2);

    let subsValue = num1Value - num2Value;
    result_values!.textContent = "Result: "+subsValue.toString() 
    


  }


  multiResult(){

    const result_values = document.getElementById("result_values");
     let num1Value = parseInt(this.num1);
     let num2Value = parseInt(this.num2);

     let mult = num1Value * num2Value;
    result_values!.textContent = "Result: "+mult.toString()

  }



}
