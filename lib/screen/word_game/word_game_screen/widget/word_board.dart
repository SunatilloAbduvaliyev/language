import 'package:english/cubit/word_game/word_game_cubit.dart';
import 'package:english/utils/extension/extension.dart';
import 'package:english/utils/images/app_images.dart';
import 'package:english/utils/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubit/word_game/word_game_state.dart';

Widget wordBoard() {
  return Stack(
    children: [
      Image.asset(
        AppImages.wordBoard,
        width: width,
        fit: BoxFit.cover,
      ),
      Positioned(
        child: BlocBuilder<WordGameCubit, WordGameState>(
          builder: (BuildContext context, WordGameState state) {
            return Text(
              state.questionWord,
              style: AppTextStyle.bold,
            );
          },
        ),
      ),
    ],
  );
}
