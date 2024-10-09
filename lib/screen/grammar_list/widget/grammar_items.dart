import 'package:english/data/model/basic_grammar/basic_grammar_model.dart';
import 'package:english/data/model/basic_grammar/grammar/grammar_model.dart';
import 'package:english/data/model/hero_tag.dart';
import 'package:english/screen/widgets/rating_lesson.dart';
import 'package:english/utils/extension/extension.dart';
import 'package:english/utils/images/app_images.dart';
import 'package:english/utils/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../widgets/hero_widget.dart';

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
      itemCount: basicGrammarModel.grammarLength,
      padding: const EdgeInsets.all(16),
      separatorBuilder: (context, index) => const Divider(),
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
          child: buildReview(
            grammarModel: grammarModel,
            index: index,
          ),
        );
      });

  Widget buildReview({
    required GrammarModel grammarModel,
    required int index,
  }) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (index == 0)
              ratingLesson(
                basicGrammarModel: basicGrammarModel,
                color: Colors.white,
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HeroWidget(
                  tag: HeroTag.avatar(AppImages.errorImage, index),
                  child: const CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.black12,
                    backgroundImage: AssetImage(
                      AppImages.errorImage,
                    ),
                  ),
                ),
                Text(
                  grammarModel.subjectName,
                  style: AppTextStyle.bold.copyWith(
                    color: Colors.white,
                  ),
                ),
                Text(
                  "${grammarModel.subjectName}two",
                  style: AppTextStyle.bold.copyWith(color: Colors.white),
                ),
                const Icon(
                  Icons.lock,
                  size: 24,
                  color: Colors.white,
                )
              ],
            ),
            8.boxH(),
            Text(
              "${grammarModel.subjectName}three",
              style: AppTextStyle.bold.copyWith(
                color: Colors.white,
              ),
            ),
          ],
        ),
      );
}
