import 'package:flutter/material.dart';
import 'dart:math';

class CalculatorBrain{
  CalculatorBrain({this.height,this.weight});
  final int ?height;
  final int ?weight;
  double _bmi=0;
  String calculateBMI(){
    _bmi=weight! / pow(height!/100,2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi>=25){
      return 'OVERWEIGHT';
    }
    else if(_bmi>18.5){
      return 'NORMAL';
    }
    else {
      return 'UNDERWEIGHT';
    }
  }

  String getInterpretation(){
    if(_bmi>=25){
      return 'MOTU KAM KHAO AUR EXERCISE KARO';
    }
    else if(_bmi>18.5){
      return 'YOU HAVE A NORMAL BODY WEIGHT!!';
    }
    else {
      return 'KUPOSHIT, KHANA NI MILTA HAI KYA??';
    }
  }


}