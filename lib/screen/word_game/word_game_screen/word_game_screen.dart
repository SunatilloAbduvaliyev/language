import 'package:easy_localization/easy_localization.dart';
import 'package:english/data/model/forms_status.dart';
import 'package:english/data/model/word/word_model.dart';
import 'package:english/screen/word_game/word_game_screen/widget/letter_button.dart';
import 'package:english/screen/word_game/word_game_screen/widget/word_board.dart';
import 'package:english/screen/word_game/word_started_screen/widget/word_button.dart';
import 'package:english/utils/extension/extension.dart';
import 'package:english/utils/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/word_game_cubit/word_game_cubit.dart';
import '../../../cubit/word_game_cubit/word_game_state.dart';

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
          Positioned(
            top: 400.h,
            bottom: 0,
            left: 20,
            right: 0,
            child: BlocBuilder<WordGameCubit, WordGameState>(
              builder: (BuildContext context, WordGameState state) {
                debugPrint(
                    'word cubit list index _______________________ ${state.activeButton}');
                return SingleChildScrollView(
                  child: Wrap(
                    children: List.generate(
                      state.wordLetter.length,
                      (int index) => Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.read<WordGameCubit>().deleteActive(
                                    index: index,
                                    word: state.wordLetter[index],
                                  );
                            },
                            child: Container(
                              width: 100.w,
                              height: 100.h,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.3),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          Visibility(
                            visible: !state.activeButton.contains(index),
                            child: LetterButton(
                              isActive: state.activeButton.contains(index),
                              letter: state.wordLetter[index],
                              onTap: () {
                                context.read<WordGameCubit>().checkWord(
                                      word: state.wordLetter[index],
                                      activeButton: index,
                                    );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: 20.h,
            child: Row(
              children: [
                wordButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                BlocBuilder<WordGameCubit, WordGameState>(
                  builder: (BuildContext context, WordGameState state) {
                    return Visibility(
                      visible: state.status == FormsStatus.success,
                      child: wordButton(
                        title: state.wordIndex>=state.listLength?"finish".tr():"next".tr(),
                        onTap: () {
                            if(state.wordIndex>=state.listLength){
                                Navigator.pop(context);
                            }else{
                              WordModel wordModel =
                              widget.listWord[state.wordIndex];
                              context.read<WordGameCubit>().startGame(
                                trueAnswer: wordModel.english,
                                questionWord: wordModel.translateWord,
                                wordIndex: state.wordIndex,
                              );
                            }
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
