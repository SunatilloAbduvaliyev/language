import 'package:english/data/model/forms_status.dart';
import 'package:english/utils/extension/extension.dart';
import 'package:english/utils/images/app_images.dart';
import 'package:english/utils/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubit/word_game_cubit/word_game_cubit.dart';
import '../../../../cubit/word_game_cubit/word_game_state.dart';

Widget wordBoard() {
  return Stack(
    children: [
      Image.asset(
        AppImages.wordBoard,
        width: width,
        fit: BoxFit.cover,
      ),
      Positioned(
        top:70.h,
        left: 30.w,
        child: BlocBuilder<WordGameCubit, WordGameState>(
          builder: (BuildContext context, WordGameState state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.questionWord,
                  style: AppTextStyle.bold.copyWith(
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
                5.boxH(),
                Text(
                  state.word,
                  style: AppTextStyle.bold.copyWith(
                    fontSize: 25,
                    color: state.status == FormsStatus.success?Colors.green:state.status==FormsStatus.error?Colors.red:Colors.white,
                  ),
                ),
                5.boxH(),
                Text(
                  "${state.word.length.toString()}/${state.trueAnswer.length.toString()}",
                  style: AppTextStyle.bold.copyWith(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    ],
  );
}
