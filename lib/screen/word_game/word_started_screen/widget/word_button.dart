import 'package:easy_localization/easy_localization.dart';
import 'package:english/utils/extension/extension.dart';
import 'package:english/utils/images/app_images.dart';
import 'package:english/utils/style/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

Widget wordButton({
  String title = 'back',
  required VoidCallback onTap,
  bool isLoading=false,
}) {
  return ZoomTapAnimation(
    onTap: onTap,
    child: Stack(
      children: [
        Image.asset(
          AppImages.wordButton,
          width: 180.w,
        ),
        Positioned(
          right: 0,
          left: 0,
          top: 15.h,
          child: isLoading
              ? const CupertinoActivityIndicator(
                  color: Colors.white,
                )
              : Text(
                  title.tr(),
                  style: AppTextStyle.bold.copyWith(
                    color: Colors.white,
                    shadows: [
                      const Shadow(
                        blurRadius: 5.0, // Soya tarqalishi
                        color: Colors.red, // Soya rangi (qizil)
                        offset: Offset(2.0, 2.0), // Soya yo'nalishi,
                      ),
                    ],
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
        ),
      ],
    ),
  );
}
