import 'package:english/app/app.dart';
import 'package:english/cubit/active_button_cubit/active_button_cubit.dart';
import 'package:english/utils/color/app_colors.dart';
import 'package:english/utils/extension/extension.dart';
import 'package:english/utils/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class VariantItem extends StatefulWidget {
  const VariantItem({
    super.key,
    required this.variants,
  });

  final List<String> variants;
  @override
  State<VariantItem> createState() => _VariantItemState();
}

class _VariantItemState extends State<VariantItem> {
  List<String> variantCharacters = ['A', "B", "C", "D"];
  int activeIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        variantCharacters.length,
        (int index) => ZoomTapAnimation(
          onTap: (){
            setState(() {
              activeIndex=index;
            });
            context.read<ActiveButtonCubit>().changeState(isActive: true, data: widget.variants[index]);
          },
          child: Container(
            padding: EdgeInsets.all(10.w),
            margin: EdgeInsets.only(top: 7.h),
            decoration: BoxDecoration(
              color: activeIndex == index?Colors.blueAccent:Colors.white,
              borderRadius: BorderRadius.circular(16.w),
            ),
            child: Row(
              children: [
                Container(
                  width: 40.w,
                  height: 40.w,
                  decoration: BoxDecoration(
                    color: activeIndex == index?Colors.white:AppColors.cF3F3F3,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: activeIndex==index?const Icon(
                      Icons.check,
                      size: 30,
                      color: Colors.blueAccent,
                    ):Text(
                      variantCharacters[index],
                      style: AppTextStyle.bold.copyWith(
                        fontSize: 20.w,
                      ),
                    ),
                  ),
                ),
                10.boxW(),
                Text(
                  widget.variants[index],
                  style: AppTextStyle.bold.copyWith(
                    color: activeIndex==index?Colors.white:AppColors.c000000,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
