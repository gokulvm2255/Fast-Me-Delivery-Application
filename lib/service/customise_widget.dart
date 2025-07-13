import 'package:flutter/material.dart';

class Appwidget{

    static TextStyle headlineTextstyle(double textsize){
      return TextStyle(
        color: Colors.black,
        fontSize: textsize,
        fontWeight: FontWeight.bold,
      );
    }

     static TextStyle normalineTextstyle(double textsize){
      return TextStyle(
        color: Colors.black,
        fontSize: textsize,
        fontWeight: FontWeight.w500,
      );
    }

    static TextStyle simplelineTextstyle(){
      return TextStyle(
        color: Colors.black,
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
      );
    }

    static TextStyle whitetextstyle(){
      return TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.bold, 
      );
    }

    static TextStyle diffwhitetextstyle(){
      return TextStyle(
        color: Colors.white54,
        fontSize: 18.0,
        fontWeight: FontWeight.w400,  
      );
    } 

     static TextStyle anotherwhitetextstyle(double textsize){
      return TextStyle(
        color: Colors.white,
        fontSize: textsize,
        fontWeight: FontWeight.bold, 
      );
    }
    
}