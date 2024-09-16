import 'package:easy_localization/easy_localization.dart';
import 'package:english/screen/word_game/word_started_screen/widget/word_active_index.dart';
import 'package:english/utils/extension/extension.dart';
import 'package:english/utils/images/app_images.dart';
import 'package:english/utils/style/app_text_style.dart';
import 'package:flutter/material.dart';

Widget wordTable() {
  return StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) {
      return Stack(
        children: [
          Image.asset(
            AppImages.wordTable,
            height: 420.h,
            width: width,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 150.h,
            right: 130.w,
            child: Text(
              'is_check_word'.tr(),
              style: AppTextStyle.bold.copyWith(
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 210.h,
            right: 80.w,
            left: 80.w,
            child: tableButton(
              title: 'all'.tr(),
              onTap: (){
                setState((){
                  wordActiveIndex =1;
                });
              },
              isActive: wordActiveIndex == 1,
            ),
          ),
          Positioned(
            top: 275.h,
            right: 80.w,
            left: 80.w,
            child: tableButton(
              title: 'me'.tr(),
              onTap: (){
                setState((){
                  wordActiveIndex =2;
                });
              },
              isActive: wordActiveIndex == 2,
            ),
          ),
          Positioned(
            top: 350.h,
            right: 80.w,
            left: 80.w,
            child: tableButton(
              title: 'favourite'.tr(),
              onTap: (){
                setState((){
                  wordActiveIndex =3;
                });
              },
              isActive: wordActiveIndex == 3,
            ),
          ),
        ],
      );
    },
  );
}

Widget tableButton({
  required String title,
  required VoidCallback onTap,
  required bool isActive,
}) {
  return TextButton(
    onPressed: onTap,
    child: Text(
      title,
      style: AppTextStyle.bold.copyWith(
        color: isActive ? Colors.white : Colors.grey,
      ),
      textAlign: TextAlign.center,
    ),
  );
}
