import 'package:flutter/material.dart';
class CustomGradient{

 static LinearGradient customGradient(Color startColor, Color endColor,
      [Alignment begin= Alignment.centerLeft,Alignment end= Alignment.bottomCenter,]){
    return LinearGradient(colors: [startColor,endColor],
        begin: begin,
        end: end,

    );
  }
}
