import 'package:flutter/material.dart';
import 'package:myapp/widget/text.dart';

Widget button(String buttonText,Color color,double buttonPadding) {
  return Container(width: 75,height: 21,
    margin:  EdgeInsets.only(right:buttonPadding,top: buttonPadding,bottom: buttonPadding),alignment: Alignment.center,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color),
    child: commonText(buttonText, Colors.white, FontWeight.w500, 12),
  );
}
