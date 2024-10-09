import 'package:cached_network_image/cached_network_image.dart';
import 'package:english/data/model/basic_grammar/basic_grammar_model.dart';
import 'package:english/screen/grammar_list/widget/grammar_items.dart';
import 'package:english/data/model/hero_tag.dart';
import 'package:english/screen/widgets/hero_widget.dart';
import 'package:english/utils/extension/extension.dart';
import 'package:english/utils/style/app_text_style.dart';
import 'package:flutter/material.dart';
import '../../utils/color/app_colors.dart';

class GrammarListScreen extends StatefulWidget {
  const GrammarListScreen({
    super.key,
    required this.animation,
    required this.basicGrammarModel,
  });

  final Animation<double> animation;
  final BasicGrammarModel basicGrammarModel;

  @override
  State<GrammarListScreen> createState() => _GrammarListScreenState();
}

class _GrammarListScreenState extends State<GrammarListScreen> {
  @override
  Widget build(BuildContext context) => SafeArea(
    child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: AppColors.c356899.withOpacity(0.6),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: Colors.transparent,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.close,
                  size: 24,
                  color: Colors.white,
                ),
              ),
              10.boxW(),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    SizedBox.expand(
                      child: HeroWidget(
                        tag: HeroTag.image(widget.basicGrammarModel.backgroundImage),
                        child: CachedNetworkImage(
                          imageUrl: widget.basicGrammarModel.backgroundImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      widget.basicGrammarModel.themeName,
                      style: AppTextStyle.bold.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: GrammarItems(
                  basicGrammarModel: widget.basicGrammarModel,
                  animation: widget.animation,
                ),
              )
            ],
          ),
        ),
  );
}
