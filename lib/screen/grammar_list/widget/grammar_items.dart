import 'package:english/app/app.dart';
import 'package:english/cubit/active_button_cubit/active_button_cubit.dart';
import 'package:english/cubit/quiz_cubit/quiz_cubit.dart';
import 'package:english/data/model/basic_grammar/basic_grammar_model.dart';
import 'package:english/data/model/basic_grammar/grammar/grammar_model.dart';
import 'package:english/screen/grammar_list/widget/build_grammar_item.dart';
import 'package:english/screen/grammar_list/widget/build_quiz_item.dart';
import 'package:english/screen/quiz_game/quiz_game_screen.dart';
import 'package:english/screen/route.dart';
import 'package:english/screen/widgets/rating_lesson.dart';
import 'package:english/utils/color/app_colors.dart';
import 'package:english/utils/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GrammarItems extends StatelessWidget {
  final BasicGrammarModel basicGrammarModel;
  final Animation<double> animation;

  const GrammarItems({
    super.key,
    required this.basicGrammarModel,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) => ListView.separated(
        itemCount: basicGrammarModel.grammars.length,
        padding: const EdgeInsets.all(16),
        separatorBuilder: (context, index) => const Divider(
          color: AppColors.c000000,
        ),
        itemBuilder: (context, index) {
          final GrammarModel grammarModel = basicGrammarModel.grammars[index];
          return AnimatedBuilder(
            animation: animation,
            builder: (context, child) => FadeTransition(
              opacity: CurvedAnimation(
                parent: animation,
                curve: const Interval(
                  0.2,
                  1,
                  curve: Curves.easeInExpo,
                ),
              ),
              child: child,
            ),
            child: Column(
              children: [
                if (index == 0)
                  ratingLesson(
                    basicGrammarModel: basicGrammarModel,
                  ),
                10.boxH(),
                buildGrammarItem(
                  grammarModel: grammarModel,
                  index: index,
                  context: context,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteName.grammarDetail,
                      arguments: basicGrammarModel.grammars[index],
                    );
                  },
                ),
                  const Divider(
                   color: AppColors.c000000,
                ),
                buildQuizItem(
                  index: index,
                  context: context,
                  onTap: () {
                    context.read<ActiveButtonCubit>().initialState();
                    context.read<QuizCubit>().startQuiz(gameQuiz: basicGrammarModel.grammars[index].quiz);
                    Navigator.pushNamed(context, RouteName.quizGameScreen,);
                  },
                ),
              ],
            ),
          );
        },
      );
}
