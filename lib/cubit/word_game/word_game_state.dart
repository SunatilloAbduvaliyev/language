import 'package:english/data/model/forms_status.dart';

class WordGameState {
  final String trueAnswer;
  final String questionWord;
  final String word;
  final FormsStatus status;

  WordGameState({
    required this.word,
    required this.trueAnswer,
    required this.questionWord,
    required this.status,
  });

  WordGameState copyWith({
    String? trueAnswer,
    String? questionWord,
    String? word,
    FormsStatus? status,
  }) =>
      WordGameState(
        questionWord: questionWord ?? this.questionWord,
        word: word ?? this.word,
        trueAnswer: trueAnswer ?? this.trueAnswer,
        status: status ?? this.status,
      );

  static WordGameState initialValue() => WordGameState(
        trueAnswer: '',
        questionWord: '',
        status: FormsStatus.pure,
        word:  '',
      );
}
