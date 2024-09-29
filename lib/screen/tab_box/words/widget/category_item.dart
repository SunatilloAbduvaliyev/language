import 'package:easy_localization/easy_localization.dart';
import 'package:english/cubit/word_category_cubit/word_category_cubit.dart';
import 'package:english/utils/color/app_colors.dart';
import 'package:english/utils/style/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryItem extends StatefulWidget {
  const CategoryItem({super.key});

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.cF3F3F3,
      child: CupertinoSlidingSegmentedControl<int>(
        children: {
          0: Text(
            'all'.tr(),
            style: AppTextStyle.bold.copyWith(
              color: index == 0 ? Colors.white:AppColors.c000000
            ),
          ),
          1: Text(
            'me'.tr(),
            style: AppTextStyle.bold.copyWith(
                color: index == 1 ? Colors.white:AppColors.c000000
            ),
          ),
        },
        thumbColor: Colors.blueAccent,
        groupValue: index,
        onValueChanged: (int? newValue) {
          setState(() {
            if (newValue != null) {
              index = newValue;
              setState(() {});
            }
          });
          debugPrint("change category index _______________________________________ $index");
          context.read<WordCategoryCubit>().changeWord(index);
        },
      ),
    );
  }
}
