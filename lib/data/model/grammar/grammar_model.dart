import 'package:english/data/model/grammar/comment/comment_model.dart';
import 'package:english/data/model/grammar/images/images_model.dart';
import '../example/example_model.dart';

class GrammarModel {
  final String docId;
  final String subjectName;
  final String firstExplanation;
  final List<ExampleModel> exampleData;
  final String conclusion;
  final int likeCount;
  final int badCount;
  final List<CommentModel> commentData;
  final List<ImagesModel> imagesData;
  final int themeId;

  GrammarModel({
    required this.themeId,
    required this.docId,
    required this.subjectName,
    required this.firstExplanation,
    required this.exampleData,
    required this.conclusion,
    required this.likeCount,
    required this.badCount,
    required this.commentData,
    required this.imagesData,
  });

  factory GrammarModel.fromJson(Map<String, dynamic> json) {
    return GrammarModel(
      themeId: json['theme_id'] as int? ?? 0,
      docId: json['doc_id'] as String? ?? '',
      subjectName: json['subject_name'] as String? ?? '',
      firstExplanation: json['first_explanation'] as String? ?? '',
      exampleData: (json['example_data'] as List?)
              ?.map((element) => ExampleModel.fromJson(element))
              .toList() ??
          [],
      conclusion: json['conclusion'] as String? ?? '',
      likeCount: json['like_count'] as int? ?? 0,
      badCount: json['bad_count'] as int? ?? 0,
      commentData: (json['comment_data'] as List?)
              ?.map((element) => CommentModel.fromJson(element))
              .toList() ??
          [],
      imagesData: (json['images_data'] as List?)
              ?.map((element) => ImagesModel.fromJson(element))
              .toList() ??
          [],
    );
  }

  GrammarModel copyWith({
    String? docId,
    String? subjectName,
    String? firstExplanation,
    List<ExampleModel>? exampleData,
    String? conclusion,
    int? likeCount,
    int? badCount,
    List<CommentModel>? commentData,
    List<ImagesModel>? imagesData,
    int? themeId,
  }) =>
      GrammarModel(
        themeId: themeId ?? this.themeId,
        docId: docId ?? this.docId,
        subjectName: subjectName ?? this.subjectName,
        firstExplanation: firstExplanation ?? this.firstExplanation,
        exampleData: exampleData ?? this.exampleData,
        conclusion: conclusion ?? this.conclusion,
        likeCount: likeCount ?? this.likeCount,
        badCount: badCount ?? this.badCount,
        commentData: commentData ?? this.commentData,
        imagesData: imagesData ?? this.imagesData,
      );

  static GrammarModel initialValue() => GrammarModel(
        docId: '',
        subjectName: '',
        firstExplanation: '',
        exampleData: [],
        conclusion: '',
        likeCount: 0,
        badCount: 0,
        commentData: [],
        imagesData: [],
        themeId: 0,
      );


  Map<String, dynamic> toUpdateJson() => {
        "subject_name": subjectName,
        "first_explanation": firstExplanation,
        "example_data":
            exampleData.map((exampleData) => exampleData.toJson()).toList(),
        "conclusion": conclusion,
        "like_count": likeCount,
        'bad_count': badCount,
        'comment_data':
            commentData.map((commentData) => commentData.toJson()).toList(),
        'images_data': imagesData.map((imagesData) => imagesData.toJson()).toList(),
      };
}
