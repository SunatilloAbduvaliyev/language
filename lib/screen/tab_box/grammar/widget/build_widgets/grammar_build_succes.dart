import 'package:english/data/model/basic_grammar/basic_grammar_model.dart';
import 'package:english/screen/tab_box/grammar/widget/basic_grammar_item.dart';
import 'package:flutter/material.dart';

Widget grammarBuildSuccess(List<BasicGrammarModel> basicGrammars) {
  PageController pageController = PageController(viewportFraction: 0.9);
  return Expanded(
    child: PageView.builder(
      controller: pageController,
      itemCount: basicGrammars.length,
      itemBuilder: (BuildContext context, int index) {
        return BasicGrammarItem(basicGrammarModel: basicGrammars[index]); // Expanded ni olib tashlash
      },
    ),
  );
}

