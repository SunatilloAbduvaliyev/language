import 'package:english/utils/extension/extension.dart';
import 'package:english/utils/images/app_images.dart';
import 'package:english/utils/style/app_text_style.dart';
import 'package:flutter/material.dart';

Widget wordTitle({
  double? height,
  required String title,
}) {
  return Stack(
    children: [
      Image.asset(
        AppImages.wordThem,
        height: 80,
        width: width,
        fit: BoxFit.cover,
      ),
      Positioned(
        top: 5,
        right: 5,
        bottom: 5,
        left: 5,
        child: Text(
          title,
          style: AppTextStyle.bold.copyWith(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ],
  );
}
