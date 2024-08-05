import 'package:english/utils/extension/extension.dart';
import 'package:flutter/material.dart';
import '../shimmer/grammar_item_shimmer.dart';

Widget grammarBuildLoading() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 30.h),
    child: ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return grammarItemShimmer();
      },
    ),
  );
}