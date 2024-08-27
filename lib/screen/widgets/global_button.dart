import 'package:english/utils/extension/extension.dart';
import 'package:english/utils/style/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Widget globalButton({
  required String title,
  required VoidCallback onTap,
  Color? borderColor,
  backgroundColor,
  textColor,
  loadingColor,
  double radius = 16,
  TextStyle? textStyle,
  bool isLoading = false,
}) {
  return Ink(
    decoration: BoxDecoration(
      color: backgroundColor ?? Colors.blueAccent,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(
        width: 1,
        color: borderColor ?? Colors.transparent,
      ),
    ),
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(radius),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 13.h),
        child: Center(
          child: isLoading
              ? CupertinoActivityIndicator(
                  color: loadingColor ?? Colors.white,
                )
              : Text(
                  title,
                  style: textStyle ??
                      AppTextStyle.bold
                          .copyWith(color: textColor ?? Colors.white),
                  textAlign: TextAlign.center,
                ),
        ),
      ),
    ),
  );
}