import 'package:cached_network_image/cached_network_image.dart';
import 'package:english/screen/grammar_detail/widget/example_item.dart';
import 'package:english/screen/grammar_detail/widget/eye_theme_dialog.dart';
import 'package:english/screen/widgets/global_appbar.dart';
import 'package:english/screen/widgets/shimmers/shimmer_item.dart';
import 'package:english/utils/color/app_colors.dart';
import 'package:english/utils/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import '../../data/model/basic_grammar/grammar/grammar_model.dart';
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
    debugPrint("____________________________________ build run grammar detail");
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HtmlWidget(
              widget.grammarModel.firstExplanation,
              textStyle: AppTextStyle.medium.copyWith(
                color: textColor,
              ),
            ),
            if(widget.grammarModel.exampleData.isNotEmpty)
            ExampleItem(
                exampleModel: widget.grammarModel.exampleData,
                textColor: textColor),
            if(widget.grammarModel.imagesData.isNotEmpty)
            SizedBox(
              height: 700.h,
              width: double.infinity,
              child: CardSwiper(
                cardBuilder: (BuildContext context, index, x, y) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20.w),
                    child: CachedNetworkImage(
                      width: double.infinity,
                      fit: BoxFit.cover,
                      imageUrl: widget.grammarModel.imagesData[index].imageUrl,
                      placeholder: (context, url) => Center(
                        child: shimmerItem(
                          shimmerWidth: double.infinity,
                          shimmerHeight: 600,
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        color: backgroundColor,
                        child: Image.asset(
                          AppImages.errorImage,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  );
                },
                cardsCount: widget.grammarModel.imagesData.length,
                allowedSwipeDirection:
                    const AllowedSwipeDirection.only(left: true, right: true),
                numberOfCardsDisplayed: widget.grammarModel.imagesData.length,
              ),
            ),
            100.boxH()
          ],
        ).paddingHorizontal(7.w),
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
