import 'package:english/utils/color/app_colors.dart';
import 'package:english/utils/extension/extension.dart';
import 'package:english/utils/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

Widget gameButton({
  required String imagePath,
  required String title,
  required VoidCallback onTap,
}) {
  return ZoomTapAnimation(
    onTap: onTap,
    child: Container(
      width: 100.w,
      padding: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.w),
        border: Border.all(
          color: AppColors.c000000,
          width: 1,
        ),
        color: AppColors.cF3F3F3,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 2,
            spreadRadius: 1,
            offset: Offset(5, 9)
          )
        ]
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.w),
              topRight: Radius.circular(16.w),
            ),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          5.boxH(),
          Text(
            title,
            style: AppTextStyle.bold,
            textAlign: TextAlign.center,
          ),
          30.boxH(),
        ],
      ),
    ),
  );
}
