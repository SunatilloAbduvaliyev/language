import 'package:easy_localization/easy_localization.dart';
import 'package:english/data/model/word/word_model.dart';
import 'package:english/screen/widgets/global_appbar.dart';
import 'package:english/screen/widgets/to_speak_button.dart';
import 'package:english/utils/extension/extension.dart';
import 'package:english/utils/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class WordDetailScreen extends StatelessWidget {
  const WordDetailScreen({
    super.key,
    required this.wordModel,
  });

  final WordModel wordModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        title: "word_detail".tr(),
        navigatePop: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.boxH(),
          Row(
            children: [
              Expanded(
                child: Text(
                  wordModel.english,
                  style: AppTextStyle.bold.copyWith(
                    fontSize: 20.w,
                  ),
                ),
              ),
              toSpeakButton(speakText: wordModel.english),
            ],
          ),
          5.boxH(),
          Text(
            "[ ${wordModel.phonetics} ]",
            style: AppTextStyle.medium.copyWith(letterSpacing: 2),
          ),
          5.boxH(),
          Text(
            wordModel.translateWord,
            style: AppTextStyle.bold.copyWith(
              fontSize: 20.w,
            ),
          ),
          5.boxH(),
          Text(
            wordModel.wordConcept,
            style: AppTextStyle.medium,
          ),
          5.boxH(),
          ...List.generate(
            wordModel.exampleEn.length,
            (int index) => HtmlWidget(
              """<ol>
               <li>${wordModel.exampleEn[index].example}<ul><li>${wordModel.exampleEn[index].exampleExplanation}</li></ul></li>
              </ol>""",
              textStyle: AppTextStyle.bold,
            ),
          ),
        ],
      ).paddingHorizontal(14),
    );
  }
}
