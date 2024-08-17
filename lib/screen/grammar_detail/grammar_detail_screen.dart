import 'package:english/screen/grammar_detail/widget/eye_theme_dialog.dart';
import 'package:english/screen/widgets/global_appbar.dart';
import 'package:english/utils/color/app_colors.dart';
import 'package:english/utils/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../data/model/grammar/grammar_model.dart';
import '../../utils/images/app_images.dart';
import '../../utils/style/app_text_style.dart';

class GrammarDetailScreen extends StatefulWidget {
  const GrammarDetailScreen({super.key, required this.grammarModel});

  final GrammarModel grammarModel;

  @override
  State<GrammarDetailScreen> createState() => _GrammarDetailScreenState();
}

class _GrammarDetailScreenState extends State<GrammarDetailScreen> {
  Color backgroundColor = AppColors.cF3F3F3, textColor = AppColors.c000000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: GlobalAppBar(
        title: widget.grammarModel.subjectName,
        navigatePop: true,
        color: textColor,
        backgroundColor: backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HtmlWidget(
              widget.grammarModel.firstExplanation,
              textStyle: AppTextStyle.medium.copyWith(
                color: textColor,
              ),
            ),
          ],
        ).paddingHorizontal(14.w),
      ),
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: Colors.blueAccent,
          onPressed: () {
            showModalDialog(
              context: context,
              onColorsChanged: (bgColor, txtColor) {
                setState(() {
                  backgroundColor = bgColor;
                  textColor = txtColor;
                });
              },
            );
          },
          child: Center(
            child: SvgPicture.asset(
              AppImages.eye,
              width: 24.w,
              height: 24.h,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
    );
  }
}
