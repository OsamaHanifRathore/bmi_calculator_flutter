import 'dart:math';

import 'package:flutter/cupertino.dart';

class CalculatorBrain {

 final int height;
 final int weight;
 double _bmi;
 CalculatorBrain({this.height, this.weight});
 String calculateBMI(){
   _bmi = weight/pow(height / 100, 2);
   return _bmi.toStringAsFixed(1);
 }

 String getResult(){
   if(_bmi >= 25){
     return 'OverWeight';
   }
   else if( _bmi > 18.5){
     return "Normal";
} else {return 'UnderWeight';}
}

 String getInterpretation(){
   if(_bmi >= 25){
     return 'you have a heigher body weight please take care';
   }
   else if( _bmi > 18.5) {
     return "you have normal body weight good job";

   } else {return 'you have a low body weight please eat more';}
 }
}