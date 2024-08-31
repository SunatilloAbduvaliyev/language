import 'package:english/utils/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


Widget emptyItem(){
  return Center(
    child: Lottie.asset(AppImages.empty),
  );
}