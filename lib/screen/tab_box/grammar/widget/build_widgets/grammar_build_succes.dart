import 'package:english/utils/extension/extension.dart';
import 'package:flutter/material.dart';
import '../../../../../data/model/grammar/grammar_model.dart';
import '../grammar_item.dart';

Widget grammarBuildSuccess(List<GrammarModel> grammarList) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 30.h),
    child: ListView.builder(
      itemCount: grammarList.length,
      itemBuilder: (BuildContext context, int index) {
        return grammarItem(grammarModel: grammarList[index], index: index);
      },
    ),
  );
}
