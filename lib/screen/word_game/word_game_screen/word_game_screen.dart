import 'package:english/data/model/word/word_model.dart';
import 'package:english/screen/word_game/word_game_screen/widget/word_board.dart';
import 'package:english/utils/extension/extension.dart';
import 'package:english/utils/images/app_images.dart';
import 'package:flutter/material.dart';

class WordGameScreen extends StatefulWidget {
  const WordGameScreen({
    super.key,
    required this.listWord,
  });

  final List<WordModel> listWord;

  @override
  State<WordGameScreen> createState() => _WordGameScreenState();
}

class _WordGameScreenState extends State<WordGameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.wordBackground,
            width: width,
            height: MediaQuery.sizeOf(context).height,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 20,
            right: 0,
            left: 0,
            child: wordBoard(),
          ),
        ],
      ),
    );
  }
}
