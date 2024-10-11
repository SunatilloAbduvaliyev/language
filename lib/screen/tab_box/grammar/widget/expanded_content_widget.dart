import 'package:easy_localization/easy_localization.dart';
import 'package:english/data/model/basic_grammar/basic_grammar_model.dart';
import 'package:english/data/model/hero_tag.dart';
import 'package:english/utils/extension/extension.dart';
import 'package:english/utils/images/app_images.dart';
import 'package:english/utils/style/app_text_style.dart';
import 'package:flutter/material.dart';
import '../../../widgets/hero_widget.dart';
import '../../../widgets/rating_lesson.dart';

class ExpandedContentWidget extends StatelessWidget {
  final BasicGrammarModel basicGrammarModel;
  final VoidCallback startButtonTap;

  const ExpandedContentWidget({
    super.key,
    required this.basicGrammarModel,
    required this.startButtonTap,
  });

  @override
  Widget build(BuildContext context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 2,
              spreadRadius: 1,
              offset: Offset(5, 3),
            ),
          ]
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            buildAddressRating(),
            12.boxH(),
            ratingLesson(basicGrammarModel: basicGrammarModel),
            12.boxH(), // Yangi bo'sh joy qo'shildi
            buildReview(),
          ],
        ),
      );

  Widget buildAddressRating() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          HeroWidget(
            tag: HeroTag.addressLine2(basicGrammarModel.themeName),
            child: Text(
              "start_lesson".tr(),
              style: AppTextStyle.bold,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
            ),
            onPressed: startButtonTap,
            child: Text(
              'get_started'.tr(),
              style: AppTextStyle.bold.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ],
      );

  Widget buildReview() => Row(
        children: basicGrammarModel.grammars.map((grammarData) {
          int index = basicGrammarModel.grammars.indexOf(grammarData);
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: HeroWidget(
              tag: HeroTag.avatar(AppImages.errorImage, index),
              child: const CircleAvatar(
                radius: 16,
                backgroundColor: Colors.black12,
                backgroundImage: AssetImage(AppImages.errorImage),
              ),
            ),
          );
        }).toList(),
      );
}
