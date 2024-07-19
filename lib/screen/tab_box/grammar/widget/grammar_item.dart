import 'package:english/cubit/like_cubit/like_cubit.dart';
import 'package:english/data/model/forms_status.dart';
import 'package:english/screen/widgets/like_button.dart';
import 'package:english/utils/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubit/like_cubit/like_state.dart';
import '../../../../data/model/grammar/grammar_model.dart';
import '../../../../utils/style/app_text_style.dart';
import '../../../widgets/shimmers/shimmer_circle.dart';
import '../../../widgets/shimmers/shimmer_item.dart';

Widget grammarItem({
  required GrammarModel grammarModel,
  required int index,
}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.w),
      border: Border.all(
        width: 1,
        color: Colors.blueAccent,
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          grammarModel.subjectName,
          style: AppTextStyle.semiBold,
        ),
        BlocBuilder<LikeCubit, LikeState>(
          builder: (BuildContext context, LikeState state) {
            if (state.status == FormsStatus.loading || state.status == FormsStatus.pure) {
              return Row(
                children: [
                  shimmerCircle(),
                  shimmerItem(shimmerWidth: 40, shimmerHeight: 20),
                  shimmerCircle(),
                  shimmerItem(shimmerWidth: 40, shimmerHeight: 20),
                ],
              );
            }
            return Row(
              children: [
                likeButton(
                  onTap: () {},
                ),
                SizedBox(
                  width: 40, // Giving fixed width to avoid layout issues
                  child: Text(
                    grammarModel.likeCount.toString(),
                    style: AppTextStyle.regular.copyWith(
                      fontSize: 12.w,
                    ),
                  ),
                ),
                10.boxW(),
                likeButton(
                  onTap: () {},
                  isLike: false,
                ),
                SizedBox(
                  width: 40, // Giving fixed width to avoid layout issues
                  child: Text(
                    grammarModel.badCount.toString(),
                    style: AppTextStyle.regular.copyWith(
                      fontSize: 12.w,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    ),
  );
}
