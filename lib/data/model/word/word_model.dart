import '../example/example_model.dart';

class WordModel {
  final String english;
  final String translateWord;
  final String russian;
  final String phonetics;
  final List<ExampleModel> exampleEn;
  final bool isLike;
  final String uid;
  final String wordConcept;

  WordModel({
    required this.uid,
    required this.english,
    required this.translateWord,
    required this.russian,
    required this.phonetics,
    required this.exampleEn,
    required this.isLike,
    required this.wordConcept,
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
      wordConcept:  json['word_concept'] as String? ?? '',
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
    'word_concept':wordConcept,
  };
  Map<String, dynamic> toUpdateJson() => {
    'english': english,
    'uzbek': translateWord,
    'russian': russian,
    'phonetics': phonetics,
    'example_en': exampleEn.map((e)=>e.toJson()),
    'is_like': isLike,
    'word_concept':wordConcept,
  };

  WordModel copyWith({
    String? english,
    String? translateWord,
    String? russian,
    String? phonetics,
    List<ExampleModel>? exampleEn,
    bool? isLike,
    String? uid,
    String? wordConcept,
  }) {
    return WordModel(
      uid: uid ?? this.uid,
      english: english ?? this.english,
      translateWord: translateWord ?? this.translateWord,
      russian: russian ?? this.russian,
      phonetics: phonetics ?? this.phonetics,
      exampleEn: exampleEn ?? this.exampleEn,
      isLike: isLike ?? this.isLike,
      wordConcept: wordConcept ?? this.wordConcept,
    );
  }

  static WordModel initialValue() => WordModel(
    uid: '',
    english: '',
    translateWord: '',
    russian: '',
    phonetics: '',
    exampleEn: [],
    isLike: true,
    wordConcept: '',
  );
}