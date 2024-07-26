import 'package:english/screen/widgets/shimmers/shimmer_item.dart';
import 'package:english/utils/extension/extension.dart';
import 'package:flutter/material.dart';

import '../../../widgets/shimmers/shimmer_circle.dart';

Widget grammarItemShimmer() {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10.h),
    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.w),
      border: Border.all(
        width: 1,
        color:  Colors.grey,
      ),
    ),
    child: Row(
      children: [
        shimmerItem(
          shimmerHeight: 50,
          shimmerWidth: 70,
        ),
        SizedBox(width: 10.w),
        shimmerCircle(),
        SizedBox(width: 10.w),
        shimmerItem(
          shimmerWidth: 40,
          shimmerHeight: 20
        ),
        SizedBox(width: 10.w),
        shimmerCircle(),
        SizedBox(width: 10.w),
        shimmerItem(
            shimmerWidth: 40,
            shimmerHeight: 20
        ),
      ],
    ),
  );
}