import 'package:english/screen/quiz_game/widget/quiz_button.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../../../data/model/quiz/quiz_model.dart';
import '../../../../utils/extension/extension.dart';
import '../../../../utils/style/app_text_style.dart';
import '../quiz_item.dart';

Widget quizItemBuild({
  required int grammarLength,
  required QuizModel quizModel,
  required int index,
}) =>
    Column(
      children: [
        LinearPercentIndicator(
          width: width - 100,
          lineHeight: 20.0,
          percent: 0.8,
          trailing: RichText(
            text: TextSpan(
              text: "${index.toString()}/",
              style: AppTextStyle.bold.copyWith(fontSize: 20),
              children: [
                TextSpan(
                  text: grammarLength.toString(),
                  style: AppTextStyle.bold.copyWith(
                    fontSize: 24.w,
                  ),
                ),
              ],
            ),
          ),
          barRadius: Radius.circular(20.w),
          progressColor: Colors.blueAccent,
        ),
        10.boxH(),
        Text(
          quizModel.question,
          style: AppTextStyle.bold.copyWith(
            fontSize: 24.w,
          ),
        ),
        30.boxH(),
        VariantItem(
          variants: quizModel.variants,
        ),
        20.boxH(),
        quizButton(
          onTap: () {},
        ),
      ],
    ).paddingHorizontal(10);
