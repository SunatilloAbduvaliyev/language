import 'package:english/data/model/forms_status.dart';

class WordGameState {
  final String trueAnswer;
  final String questionWord;
  final String word;
  final FormsStatus status;
  final List<String> wordLetter;
  final List<int> activeButton;
  final int wordIndex;

  WordGameState({
    required this.word,
    required this.trueAnswer,
    required this.questionWord,
    required this.status,
    required this.wordLetter,
    required this.activeButton,
    required this.wordIndex,
  });

  WordGameState copyWith({
    String? trueAnswer,
    String? questionWord,
    String? word,
    FormsStatus? status,
    List<String>? wordLetter,
    List<int>? activeButton,
    int? wordIndex,
  }) =>
      WordGameState(
        wordIndex: wordIndex ?? this.wordIndex,
        activeButton: activeButton ?? this.activeButton,
        questionWord: questionWord ?? this.questionWord,
        word: word ?? this.word,
        trueAnswer: trueAnswer ?? this.trueAnswer,
        status: status ?? this.status,
        wordLetter: wordLetter ?? this.wordLetter,
      );

  static WordGameState initialValue() => WordGameState(
        trueAnswer: '',
        questionWord: '',
        status: FormsStatus.pure,
        word:  '',
        wordLetter: [],
        activeButton: [],
        wordIndex: 0,
      );
}
