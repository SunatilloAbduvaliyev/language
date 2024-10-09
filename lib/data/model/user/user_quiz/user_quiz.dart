import '../../quiz/quiz_model.dart';

class UserQuiz {
  final String quizKey;
  final List<QuizModel> quiz;
  final int errorCount;

  UserQuiz({
    required this.quizKey,
    required this.quiz,
    required this.errorCount,
  });

  factory UserQuiz.fromJson(Map<String, dynamic> json) => UserQuiz(
        quizKey: json['quiz_key'] as String? ?? '',
        quiz: (json['quiz'] as List?)
                ?.map((e) => QuizModel.fromJson(e))
                .toList() ??
            [],
        errorCount: json['error_count'] as int? ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "quiz_key": quizKey,
        "quiz": quiz.map((e) => e.toJson()),
        "error_count": errorCount,
      };

  UserQuiz copyWith({
    String? quizKey,
    List<QuizModel>? quiz,
    int? errorCount,
  }) =>
      UserQuiz(
        quizKey: quizKey ?? this.quizKey,
        quiz: quiz ?? this.quiz,
        errorCount: errorCount ?? this.errorCount,
      );

  static UserQuiz initialValue() => UserQuiz(
        quizKey: '',
        quiz: [],
        errorCount: 0,
      );
}
