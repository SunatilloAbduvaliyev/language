import 'package:english/bloc/user_bloc/user_event.dart';
import 'package:english/bloc/user_bloc/user_state.dart';
import 'package:english/cubit/grammar_cubit/grammar_cubit.dart';
import 'package:english/data/model/forms_status.dart';
import 'package:english/data/model/user/like_dislike/like_dislike_model.dart';
import 'package:english/screen/widgets/like_button.dart';
import 'package:english/utils/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../bloc/user_bloc/user_bloc.dart';
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
    margin: EdgeInsets.only(bottom: 7.h),
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
        Expanded(
          child: Text(
            grammarModel.subjectName,
            style: AppTextStyle.semiBold,
          ),
        ),
        BlocBuilder<UserBloc, UserState>(
          builder: (BuildContext context, UserState state) {
            if (state.status == FormsStatus.pure ||
                state.status == FormsStatus.loading) {
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
                  onTap: () {
                    if (state.userData.likes[index].like) {
                      LikeDislikeModel likeModel = state.userData.likes[index]
                          .copyWith(
                        like: false,
                      );
                      context.read<UserBloc>().add(
                        UpdateLikeUserEvent(
                          userModel: state.userData,
                          index: index,
                          like: state.userData.likes,
                          likeDislikeModel: likeModel,
                        ),
                      );
                      if(grammarModel.likeCount != 0){
                        grammarModel = grammarModel.copyWith(
                          likeCount: grammarModel.likeCount  - 1,
                        );
                      }
                      context.read<GrammarCubit>().updateGrammar(grammarModel: grammarModel);
                    }else{
                      LikeDislikeModel likeModel = state.userData.likes[index]
                          .copyWith(
                        like: true,
                      );
                      context.read<UserBloc>().add(
                        UpdateLikeUserEvent(
                          userModel: state.userData,
                          index: index,
                          like: state.userData.likes,
                          likeDislikeModel: likeModel,
                        ),
                      );
                      grammarModel = grammarModel.copyWith(
                        likeCount: grammarModel.likeCount + 1,
                      );
                      context.read<GrammarCubit>().updateGrammar(grammarModel: grammarModel);
                    }
                  },
                  activeLike: state.userData.likes[index].like,
                  loading: state.loadingIndex.contains(index),
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
                  activeDisLike: state.userData.likes[index].disLike,
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
