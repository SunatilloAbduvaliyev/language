class WordModel {
  final String english;
  final String uzbek;
  final String russian;
  final String phonetics;
  final String definitionUz;
  final String definitionEn;
  final String definitionRu;
  final List<String> exampleEn;
  final List<String> exampleRu;
  final bool isLike;

  WordModel({
    required this.english,
    required this.uzbek,
    required this.russian,
    required this.phonetics,
    required this.definitionUz,
    required this.definitionEn,
    required this.definitionRu,
    required this.exampleEn,
    required this.exampleRu,
    required this.isLike,
  });

  factory WordModel.fromJson(Map<String, dynamic> json) {
    return WordModel(
      english: json['english'] as String? ?? '',
      uzbek: json['uzbek'] as String? ?? '',
      russian: json['russian'] as String? ?? '',
      phonetics: json['phonetics'] as String? ?? '',
      definitionUz: json['definition_uz'] as String? ?? '',
      definitionEn: json['definition_en'] as String? ?? '',
      definitionRu: json['definition_ru'] as String? ?? '',
      exampleEn: (json['example_en'] as List<dynamic>).cast<String>() ?? [],
      exampleRu: (json['example_ru'] as List<dynamic>).cast<String>() ?? [],
      isLike: json['is_like'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        'english': english,
        'uzbek': uzbek,
        'russian': russian,
        'phonetics': phonetics,
        'definition_uz': definitionUz,
        'definition_en': definitionEn,
        'definition_ru': definitionRu,
        'example_en': exampleEn,
        'example_ru': exampleRu,
        'is_like': isLike,
      };

  WordModel copyWith({
    String? english,
    String? uzbek,
    String? russian,
    String? phonetics,
    String? definitionUz,
    String? definitionEn,
    String? definitionRu,
    List<String>? exampleEn,
    List<String>? exampleRu,
    bool? isLike,
  }) {
    return WordModel(
      english: english ?? this.english,
      uzbek: uzbek ?? this.uzbek,
      russian: russian ?? this.russian,
      phonetics: phonetics ?? this.phonetics,
      definitionUz: definitionUz ?? this.definitionUz,
      definitionEn: definitionEn ?? this.definitionEn,
      definitionRu: definitionRu ?? this.definitionRu,
      exampleEn: exampleEn ?? this.exampleEn,
      exampleRu: exampleRu ?? this.exampleRu,
      isLike: isLike ?? this.isLike,
    );
  }

  static WordModel initialValue() => WordModel(
        english: '',
        uzbek: '',
        russian: '',
        phonetics: '',
        definitionUz: '',
        definitionEn: '',
        definitionRu: '',
        exampleEn: [],
        exampleRu: [],
        isLike: false,
      );
}
