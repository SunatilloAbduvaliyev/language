import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../../cubit/active_button_cubit/active_button_cubit.dart';
import '../../../cubit/active_button_cubit/active_button_state.dart';
import '../../../utils/color/app_colors.dart';
import '../../../utils/extension/extension.dart';
import '../../../utils/style/app_text_style.dart';

Widget quizButton({
  required VoidCallback onTap,
})=> BlocBuilder<ActiveButtonCubit, ActiveButtonState>(
  builder: (BuildContext context, ActiveButtonState state) {
    return ZoomTapAnimation(
      onTap: onTap,
      child: Container(
        width: width,
        padding: EdgeInsets.symmetric(vertical: 20.w),
        decoration: BoxDecoration(
          color: state.isActive ? Colors.blueAccent : AppColors.c747475,
          borderRadius: BorderRadius.circular(16.w),
        ),
        child: Center(
          child: Text(
            'continue'.tr(),
            style: AppTextStyle.bold.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  },
);