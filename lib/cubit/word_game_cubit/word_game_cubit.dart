import 'dart:math';
import 'package:english/cubit/word_game_cubit/word_game_state.dart';
import 'package:english/data/model/forms_status.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WordGameCubit extends Cubit<WordGameState> {
  WordGameCubit() : super(WordGameState.initialValue());

  void startGame({
    required String trueAnswer,
    required String questionWord,
    required int wordIndex,
    int? wordLength,
  }) {
    List<String> wordLetter = [];
    for (int i = 0; i < trueAnswer.length; i++) {
      wordLetter.add(trueAnswer[i].toUpperCase());
      wordLetter.add(getRandomLetter());
    }
    wordLetter.shuffle();
    wordIndex = wordIndex + 1;
    emit(
      state.copyWith(
        trueAnswer: trueAnswer,
        questionWord: questionWord,
        wordLetter: wordLetter,
        wordIndex: wordIndex,
        word: '',
        activeButton: [],
        status: FormsStatus.pure,
        listLength: wordLength,
      ),
    );
  }

  String getRandomLetter() {
    List<String> alphabet = [
      'A',
      'B',
      'C',
      'D',
      'E',
      'F',
      'G',
      'H',
      'I',
      'J',
      'K',
      'L',
      'M',
      'N',
      'O',
      'P',
      'Q',
      'R',
      'S',
      'T',
      'U',
      'V',
      'W',
      'X',
      'Y',
      'Z'
    ];

    int randomIndex = Random().nextInt(alphabet.length);

    return alphabet[randomIndex];
  }

  void checkWord({
    required String word,
    required int activeButton,
  }) {
    String checkAnswer = state.word + word;
    if (checkAnswer == state.trueAnswer.toUpperCase()) {
      List<int> listIndex = state.activeButton;
      listIndex.add(activeButton);
      emit(
        state.copyWith(
          status: FormsStatus.success,
          word: checkAnswer,
          activeButton: listIndex,
        ),
      );
    } else {
      if (checkAnswer.length >= state.trueAnswer.length) {
        emit(
          state.copyWith(
            status: FormsStatus.error,
          ),
        );
      }
      List<int> listIndex = state.activeButton;
      listIndex.add(activeButton);
      String oldWord = state.word + word;
      emit(
        state.copyWith(
          word: oldWord,
          activeButton: listIndex,
        ),
      );
    }
  }

  void deleteActive({
    required int index,
    required String word,
  }) {
    List<int> listIndex = state.activeButton;
    listIndex.remove(index);
    debugPrint('delete index _______________________________ $listIndex');

    String oldWord = '';
    bool removed = false; // Harf olib tashlanganini tekshirish uchun

    for (int i = 0; i < state.word.length; i++) {
      // Agar harf mos kelsa va hali olib tashlanmagan bo'lsa
      if (state.word[i] == word && !removed) {
        removed = true; // Harfni olib tashladik
      } else {
        oldWord += state.word[i]; // Boshqa harflarni qo'shamiz
      }
    }
    if (oldWord == state.trueAnswer.toUpperCase() ) {
      emit(
        state.copyWith(
          status: FormsStatus.success,
          word: oldWord,
          activeButton: listIndex,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: FormsStatus.pure,
          word: oldWord,
          activeButton: listIndex,
        ),
      );
    }
  }
}
