// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:calculator/ScreenUI.dart';

class ScreenButtons extends StatelessWidget {
   
   final  color;
   final textColor;
   final String buttonText;
   final buttonTapped;
  ScreenButtons(
   
   {required this.buttonText, required this.color, required this.textColor,required this.buttonTapped,}
  ) ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     onTap:buttonTapped ,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(.0),
          child: Container(
            color:color,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle( color: textColor,fontWeight: FontWeight.bold,fontSize: 20),)),
    
          ),
        ),
         
      ),
    );
    
  }
}
