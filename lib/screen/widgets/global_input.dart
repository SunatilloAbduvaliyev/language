import 'package:easy_localization/easy_localization.dart';
import 'package:english/utils/extension/extension.dart';
import 'package:flutter/material.dart';

import '../../../utils/color/app_colors.dart';
import '../../../utils/style/app_text_style.dart';

class GlobalInput extends StatefulWidget {
  const GlobalInput(
      {super.key,
      required this.controller,
      required this.title,
      this.errorText = 'is_empty',
      this.isExample = false});

  final TextEditingController controller;
  final String title;
  final String errorText;
  final bool isExample;

  @override
  State<GlobalInput> createState() => _GlobalInputState();
}

class _GlobalInputState extends State<GlobalInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      autovalidateMode:
          widget.isExample ? null : AutovalidateMode.onUnfocus,
      scrollPadding: EdgeInsets.symmetric(horizontal: 10.w),
      style: AppTextStyle.regular,
      validator: widget.isExample
          ? null
          : (value) {
              if (value == null || value.isEmpty) {
                return widget.errorText.tr();
              }
              return null;
            },
      decoration: InputDecoration(
        hintText: widget.title.tr(),
        hintStyle: AppTextStyle.regular,
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.w),
          borderSide: const BorderSide(
            width: 1,
            color: AppColors.c95969D,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.w),
          borderSide: const BorderSide(
            width: 1,
            color: AppColors.c95969D,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.w),
          borderSide: const BorderSide(
            width: 1,
            color: AppColors.c95969D,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.w),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.w),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
