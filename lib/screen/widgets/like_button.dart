import 'package:english/utils/extension/extension.dart';
import 'package:english/utils/images/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget likeButton({
  required VoidCallback onTap,
  bool isLike = true,
  bool activeLike = false,
  bool activeDisLike = false,
  bool loading = false,
}) {
  return IconButton(
    onPressed: onTap,
    style: IconButton.styleFrom(
      backgroundColor: isLike
          ? Colors.green.withOpacity(activeLike ? 0.5 : 0.2)
          : Colors.red.withOpacity(activeDisLike ? 0.5 : 0.2),
    ),
    icon: loading?const CupertinoActivityIndicator(color: Colors.black,): SvgPicture.asset(
      isLike ? AppImages.like : AppImages.dontLike,
      width: 30.w,
      height: 30.h,
      colorFilter: const ColorFilter.mode(
        Colors.white,
        BlendMode.srcIn,
      ),
    ),
  );
}
