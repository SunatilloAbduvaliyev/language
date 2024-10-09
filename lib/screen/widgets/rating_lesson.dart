import 'package:easy_localization/easy_localization.dart';
import 'package:english/utils/color/app_colors.dart';
import 'package:english/utils/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../bloc/user_bloc/user_bloc.dart';
import '../../bloc/user_bloc/user_state.dart';
import '../../data/model/basic_grammar/basic_grammar_model.dart';
import '../../data/model/hero_tag.dart';
import '../../utils/style/app_text_style.dart';
import 'hero_widget.dart';

Widget ratingLesson({
  required BasicGrammarModel basicGrammarModel,
  Color? color = AppColors.c000000,
}) =>
    HeroWidget(
      tag: HeroTag.addressLine1(basicGrammarModel.themeName),
      child: BlocBuilder<UserBloc, UserState>(
        builder: (BuildContext context, UserState state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircularPercentIndicator(
                animation: true,
                circularStrokeCap: CircularStrokeCap.round,
                radius: 38.0.w,
                lineWidth: 8.0,
                percent: basicGrammarModel.grammars.isNotEmpty
                    ? state.userData.learningEnglishIndex /
                        basicGrammarModel.grammars.length
                    : 0.0,
                center: Text(
                  basicGrammarModel.grammars.isNotEmpty
                      ? "${((state.userData.learningEnglishIndex / basicGrammarModel.grammars.length) * 100).toStringAsFixed(0)}%"
                      : "0%",
                  style: AppTextStyle.bold.copyWith(color: color),
                ),
                progressColor: Colors.blueAccent,
              ),
              20.boxW(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${"all_lesson".tr()}: ${basicGrammarModel.grammars.length.toString()}",
                    style: AppTextStyle.bold.copyWith(color: color),
                  ),
                  10.boxH(),
                  Text(
                    "${"see_lesson".tr()}: ${state.userData.learningEnglishIndex.toString()}",
                    style: AppTextStyle.bold.copyWith(color: color),
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
