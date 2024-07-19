import 'package:easy_localization/easy_localization.dart';
import 'package:english/utils/extension/extension.dart';
import 'package:flutter/material.dart';

import '../../../utils/color/app_colors.dart';
import '../../../utils/style/app_text_style.dart';

Widget rowButtonItem({
  required VoidCallback onTap,
  required bool login,
}) {
  return TextButton(
    onPressed: onTap,
    child: RichText(
      text: TextSpan(
          text: login?"you_don't_have_an_account_yet?   ".tr():'do_you_have_an_account?   '.tr(),
          style: AppTextStyle.regular.copyWith(
            fontSize: 12.w,
          ),
          children: [
            TextSpan(
              text: login?'sign_up'.tr():'sign_in'.tr(),
              style: AppTextStyle.regular.copyWith(
                fontSize: 12.w,
                color: AppColors.cFCA34D,
              ),
            ),
          ]
      ),
    ),
  );
}