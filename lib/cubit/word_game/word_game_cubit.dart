import 'package:english/cubit/word_game/word_game_state.dart';
import 'package:english/data/model/forms_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WordGameCubit extends Cubit<WordGameState> {
  WordGameCubit() : super(WordGameState.initialValue());

  void startGame({
    required String trueAnswer,
    required String questionWord,
  }) {
    emit(
      state.copyWith(
        trueAnswer: trueAnswer,
        questionWord: questionWord,
      ),
    );
  }

  void checkWord({
    required String word,
  }) {
    if (word == state.trueAnswer) {
      emit(
        state.copyWith(
          status: FormsStatus.success,
          word: word,
        ),
      );
    } else {
      emit(
        state.copyWith(
          word: word,
        ),
      );
    }
  }
}
