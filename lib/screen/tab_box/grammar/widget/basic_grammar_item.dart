import 'package:english/screen/grammar_list/grammar_list_screen.dart';
import 'package:english/screen/tab_box/grammar/widget/expanded_content_widget.dart';
import 'package:english/screen/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import '../../../../data/model/basic_grammar/basic_grammar_model.dart';
import '../../../../utils/extension/extension.dart';

class BasicGrammarItem extends StatefulWidget {
  const BasicGrammarItem({
    super.key,
    required this.basicGrammarModel,
  });

  final BasicGrammarModel basicGrammarModel;

  @override
  State<BasicGrammarItem> createState() => _BasicGrammarItemState();
}

class _BasicGrammarItemState extends State<BasicGrammarItem> {
  bool isAnimated = false;

  void openDetailPage() {
    if (!isAnimated) {
      setState(() {
        isAnimated = true;
      });
      return;
    }
    Navigator.push(
      context,
      PageRouteBuilder(
          transitionDuration: const Duration(seconds: 1),
          reverseTransitionDuration: const Duration(seconds: 1),
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            final CurvedAnimation curvedAnimation = CurvedAnimation(
              parent: animation,
              curve: const Interval(
                0,
                0.5,
                curve: Curves.easeInExpo,
              ),
            );
            return FadeTransition(
              opacity: curvedAnimation,
              child: GrammarListScreen(
                animation: animation,
                basicGrammarModel: widget.basicGrammarModel,
              ),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            width: isAnimated ? width * 0.88 : width * 0.7,
            height: isAnimated ? height * 0.6 : height * 0.4,
            bottom: isAnimated ? 50.h : 200.h,
            child: ExpandedContentWidget(
              basicGrammarModel: widget.basicGrammarModel,
              startButtonTap: openDetailPage,
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            bottom: isAnimated ? 250.h : 150.h,
            child: GestureDetector(
              onTap: openDetailPage,
              onPanUpdate: (DragUpdateDetails details) {
                if (details.delta.dy < 0) {
                  setState(() {
                    isAnimated = true;
                  });
                } else if (details.delta.dy > 0) {
                  setState(() {
                    isAnimated = false;
                  });
                }
              },
              child: ImageWidget(
                basicGrammarModel: widget.basicGrammarModel,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
