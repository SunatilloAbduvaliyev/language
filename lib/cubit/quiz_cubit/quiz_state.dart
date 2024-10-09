import 'package:english/data/model/forms_status.dart';
import 'package:english/data/model/quiz/quiz_model.dart';

class QuizState {
  final int errorCount;
  final int quizIndex;
  final FormsStatus status;
  final List<QuizModel> userQuiz;
  final List<QuizModel> gameQuiz;

  QuizState({
    required this.errorCount,
    required this.quizIndex,
    required this.status,
    required this.userQuiz,
    required this.gameQuiz,
  });

  QuizState copyWith({
    int? errorCount,
    int? quizIndex,
    FormsStatus? status,
    List<QuizModel>? userQuiz,
    List<QuizModel>? gameQuiz,
  }) =>
      QuizState(
        errorCount: errorCount ?? this.errorCount,
        quizIndex: quizIndex ?? this.quizIndex,
        status: status ?? this.status,
        userQuiz: userQuiz ?? this.userQuiz,
        gameQuiz: gameQuiz ?? this.gameQuiz,
      );

  static QuizState initialValue() => QuizState(
        errorCount: 0,
        quizIndex: 0,
        status: FormsStatus.pure,
        userQuiz: [],
        gameQuiz: [],
      );
}
