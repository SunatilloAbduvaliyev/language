import 'package:english/data/model/example/example_model.dart';

class WordModel {
  final String english;
  final String translateWord;
  final String russian;
  final String phonetics;
  final List<ExampleModel> exampleEn;
  final bool isLike;
  final String uid;

  WordModel({
    required this.uid,
    required this.english,
    required this.translateWord,
    required this.russian,
    required this.phonetics,
    required this.exampleEn,
    required this.isLike,
  });

  factory WordModel.fromJson(Map<String, dynamic> json) {
    return WordModel(
      uid: json['uid'] as String? ?? '',
      english: json['english'] as String? ?? '',
      translateWord: json['uzbek'] as String? ?? '',
      russian: json['russian'] as String? ?? '',
      phonetics: json['phonetics'] as String? ?? '',
      exampleEn: (json['example_en'] as List?)
              ?.map((e) => ExampleModel.fromJson(e))
              .toList() ??
          [],
      isLike: json['is_like'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'english': english,
        'uzbek': translateWord,
        'russian': russian,
        'phonetics': phonetics,
        'example_en': exampleEn.map((e)=>e.toJson()),
        'is_like': isLike,
      };

  WordModel copyWith({
    String? english,
    String? translateWord,
    String? russian,
    String? phonetics,
    List<ExampleModel>? exampleEn,
    bool? isLike,
    String? uid,
  }) {
    return WordModel(
      uid: uid ?? this.uid,
      english: english ?? this.english,
      translateWord: translateWord ?? this.translateWord,
      russian: russian ?? this.russian,
      phonetics: phonetics ?? this.phonetics,
      exampleEn: exampleEn ?? this.exampleEn,
      isLike: isLike ?? this.isLike,
    );
  }

  static WordModel initialValue() => WordModel(
        uid: '',
        english: '',
        translateWord: '',
        russian: '',
        phonetics: '',
        exampleEn: [],
        isLike: false,
      );
}
