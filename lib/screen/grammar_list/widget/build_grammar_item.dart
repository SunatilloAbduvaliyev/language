import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/user_bloc/user_bloc.dart';
import '../../../data/model/basic_grammar/grammar/grammar_model.dart';
import '../../../data/model/hero_tag.dart';
import '../../../utils/images/app_images.dart';
import '../../../utils/style/app_text_style.dart';
import '../../widgets/circle_image.dart';
import '../../widgets/hero_widget.dart';

Widget buildGrammarItem({
  required GrammarModel grammarModel,
  required int index,
  required BuildContext context,
  required VoidCallback onTap,
}) =>
    GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HeroWidget(
                  tag: HeroTag.avatar(AppImages.errorImage, index),
                  child: circleImage(
                    imagePath: AppImages.errorImage,
                  ),
                ),
                Text(
                  grammarModel.subjectName,
                  style: AppTextStyle.bold.copyWith(
                    color: Colors.white,
                  ),
                ),
                Icon(
                  context
                              .read<UserBloc>()
                              .state
                              .userData
                              .learningEnglishIndex >=
                          index
                      ? Icons.lock_open
                      : Icons.lock,
                  size: 24,
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
