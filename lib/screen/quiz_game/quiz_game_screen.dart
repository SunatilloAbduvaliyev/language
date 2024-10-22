import 'package:easy_localization/easy_localization.dart';
import 'package:english/cubit/quiz_cubit/quiz_cubit.dart';
import 'package:english/cubit/quiz_cubit/quiz_state.dart';
import 'package:english/screen/quiz_game/widget/quiz_build/quiz_draggable_build.dart';
import 'package:english/screen/quiz_game/widget/quiz_build/quiz_test_build.dart';
import 'package:english/screen/widgets/global_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizGameScreen extends StatefulWidget {
  const QuizGameScreen({super.key});

  @override
  State<QuizGameScreen> createState() => _QuizGameScreenState();
}

class _QuizGameScreenState extends State<QuizGameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        title: 'quiz_game'.tr(),
        navigatePop: true,
      ),
      body: BlocBuilder<QuizCubit, QuizState>(
        builder: (BuildContext context, QuizState state) {
          if (true) {
            return const QuizDraggableBuild();
          }
          return quizItemBuild(
            grammarLength: state.gameQuiz.length,
            quizModel: state.gameQuiz[state.quizIndex],
            index: state.quizIndex,
          );
        },
      ),
    );
  }
}
