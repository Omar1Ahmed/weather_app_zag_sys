import 'package:flutter/material.dart';



// ignore: must_be_immutable, non_constant_identifier_names
Text CustomText({required String text,required FontWeight fontWeight,required double fontSize}){
  
  //CustomText({required String text,required FontWeight fontWeight,required double fontSize});

 
  
    return Text(
           text,
            style: TextStyle(
                color:Colors.black,
               // fontFamily: AppStrings.fontFamily,
                fontWeight: fontWeight,
                fontSize: fontSize),
          );
  }
