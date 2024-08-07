import 'package:flutter/material.dart';

Widget commonText(
    String text, Color color, FontWeight? fontWeight, double? fontsize) {
  return Text(
    text,
    style: TextStyle(
        color: color,
        fontWeight: fontWeight ?? FontWeight.w300,
        fontSize: fontsize ?? 10),
  );
}
