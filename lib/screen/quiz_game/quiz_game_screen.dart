import 'package:easy_localization/easy_localization.dart';
import 'package:english/cubit/quiz_cubit/quiz_cubit.dart';
import 'package:english/cubit/quiz_cubit/quiz_state.dart';
import 'package:english/screen/widgets/global_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../utils/extension/extension.dart';

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
        title: "quiz_game".tr(),
        navigatePop: true,
      ),
      body: BlocBuilder<QuizCubit, QuizState>(
        builder: (BuildContext context, QuizState state) {
          return Column(
            children: [
              Center(
                child: LinearPercentIndicator(
                  width: width - 50,
                  animation: true,
                  lineHeight: 20.0,
                  animationDuration: 2000,
                  percent: state.quizIndex/state.gameQuiz.length,
                  center: const Text("90.0%"),
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  progressColor: Colors.greenAccent,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
