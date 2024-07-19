import 'package:english/utils/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget shimmerItem({
  double shimmerWidth = 50,
  double shimmerHeight = 50,
}){
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: Container(
      width: shimmerWidth.w,
      height: shimmerHeight.h,
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10.w)
      ),
    ),
  );
}