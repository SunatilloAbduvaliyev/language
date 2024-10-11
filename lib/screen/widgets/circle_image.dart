import 'package:flutter/material.dart';


Widget circleImage({
  required String imagePath,
  Color backgroundColor = Colors.black12,
  double radius = 30,
})=>CircleAvatar(
  radius: radius,
  backgroundColor: backgroundColor,
  backgroundImage: AssetImage(
    imagePath,
  ),
);