
import '../../example/example_model.dart';
import '../../quiz/quiz_model.dart';
import 'comment/comment_model.dart';
import 'images/images_model.dart';

class GrammarModel {
  final String subjectName;
  final String firstExplanation;
  final List<ExampleModel> exampleData;
  final String conclusion;
  final List<CommentModel> commentData;
  final List<ImagesModel> imagesData;
  final List<QuizModel> quiz;
  final List<QuizModel> errorQuiz;

  GrammarModel({
    required this.subjectName,
    required this.firstExplanation,
    required this.exampleData,
    required this.conclusion,
    required this.commentData,
    required this.imagesData,
    required this.quiz,
    required this.errorQuiz,
  });

  factory GrammarModel.fromJson(Map<String, dynamic> json) {
    return GrammarModel(
      subjectName: json['subject_name'] as String? ?? '',
      firstExplanation: json['first_explanation'] as String? ?? '',
      exampleData: (json['example_data'] as List?)
          ?.map((element) => ExampleModel.fromJson(element))
          .toList() ??
          [],
      conclusion: json['conclusion'] as String? ?? '',
      commentData: (json['comment_data'] as List?)
          ?.map((element) => CommentModel.fromJson(element))
          .toList() ??
          [],
      imagesData: (json['images_data'] as List?)
          ?.map((element) => ImagesModel.fromJson(element))
          .toList() ??
          [],
      quiz:
      (json['quiz'] as List?)?.map((e) => QuizModel.fromJson(e)).toList() ??
          [],
      errorQuiz: (json['error_quiz'] as List?)
          ?.map((e) => QuizModel.fromJson(e))
          .toList() ??
          [],
    );
  }

  GrammarModel copyWith({
    String? subjectName,
    String? firstExplanation,
    List<ExampleModel>? exampleData,
    String? conclusion,
    List<CommentModel>? commentData,
    List<ImagesModel>? imagesData,
    List<QuizModel>? quiz,
    List<QuizModel>? errorQuiz,
  }) =>
      GrammarModel(
        subjectName: subjectName ?? this.subjectName,
        firstExplanation: firstExplanation ?? this.firstExplanation,
        exampleData: exampleData ?? this.exampleData,
        conclusion: conclusion ?? this.conclusion,
        commentData: commentData ?? this.commentData,
        imagesData: imagesData ?? this.imagesData,
        quiz: quiz ?? this.quiz,
        errorQuiz: errorQuiz ?? this.errorQuiz,
      );

  static GrammarModel initialValue() => GrammarModel(
    subjectName: '',
    firstExplanation: '',
    exampleData: [],
    conclusion: '',
    commentData: [],
    imagesData: [],
    quiz: [],
    errorQuiz: [],
  );

  Map<String, dynamic> toJson() => {
    "subject_name": subjectName,
    "first_explanation": firstExplanation,
    "example_data":
    exampleData.map((exampleData) => exampleData.toJson()).toList(),
    "conclusion": conclusion,
    'comment_data': commentData,
    'images_data':
    imagesData.map((imagesModel) => imagesModel.toJson()).toList(),
    'quiz': quiz.map((e) => e.toJson()).toList(),
    'error_quiz': errorQuiz.map((e) => e.toJson()).toList(),
  };
}