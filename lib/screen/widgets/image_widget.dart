import 'package:cached_network_image/cached_network_image.dart';
import 'package:english/data/model/basic_grammar/basic_grammar_model.dart';
import 'package:english/data/model/hero_tag.dart';
import 'package:english/utils/images/app_images.dart';
import 'package:english/utils/style/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'hero_widget.dart';

class ImageWidget extends StatelessWidget {
  final BasicGrammarModel basicGrammarModel;

  const ImageWidget({
    super.key,
    required this.basicGrammarModel,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: size.height * 0.5,
      width: size.width * 0.9,
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 2,
              spreadRadius: 1,
            ),
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(
              8,
            ),
          ),
        ),
        child: Stack(
          children: [
            buildImage(),
            Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildTopText(),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "location.latitude,",
                        style: TextStyle(color: Colors.white70),
                      ),
                      Icon(Icons.location_on, color: Colors.white70),
                      Text(
                        "location.longitude,",
                        style: TextStyle(color: Colors.white70),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildImage() => SizedBox.expand(
        child: HeroWidget(
          tag: HeroTag.image(basicGrammarModel.backgroundImage),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            child: CachedNetworkImage(
              imageUrl: basicGrammarModel.backgroundImage,
              placeholder: (BuildContext context, String url) {
                return const CupertinoActivityIndicator();
              },
              errorWidget: (BuildContext context, String url, Object error) {
                return Image.asset(AppImages.errorImage);
              },
              fit: BoxFit.cover,
            ),
          ),
        ),
      );

  Widget buildTopText() => Text(
        basicGrammarModel.themeName,
        style: AppTextStyle.bold.copyWith(
          color: Colors.white,
          fontSize: 20,
        ),
      );
}
