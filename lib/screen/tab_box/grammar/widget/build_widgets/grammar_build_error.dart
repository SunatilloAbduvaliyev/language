import 'package:english/utils/style/app_text_style.dart';
import 'package:flutter/material.dart';

Widget grammarBuildError(String errorMessage) {
  return Center(
    child: Text(errorMessage,style: AppTextStyle.bold,),
  );
}