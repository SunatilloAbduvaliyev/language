import 'package:english/data/model/word/word_model.dart';
import 'package:english/screen/route.dart';
import 'package:english/screen/widgets/to_speak_button.dart';
import 'package:english/services/text_to_speech_service.dart';
import 'package:english/utils/style/app_text_style.dart';
import 'package:flutter/material.dart';

class WordListItem extends StatefulWidget {
  const WordListItem({
    super.key,
    required this.listWords,
  });

  final List<WordModel> listWords;

  @override
  State<WordListItem> createState() => _WordListItemState();
}

class _WordListItemState extends State<WordListItem> {
  TextToSpeechService textToSpeechService = TextToSpeechService();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        widget.listWords.length,
        (int index) => ListTile(
          onTap: () {
            Navigator.pushNamed(
              context,
              RouteName.wordDetail,
              arguments: widget.listWords[index],
            );
          },
          title: Text(
            widget.listWords[index].english,
            style: AppTextStyle.bold,
          ),
          leading: toSpeakButton(speakText: widget.listWords[index].english),
        ),
      ),
    );
  }
}
