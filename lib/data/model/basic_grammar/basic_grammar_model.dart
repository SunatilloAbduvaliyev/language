
import 'grammar/grammar_model.dart';

class BasicGrammarModel {
  final String uid;
  final String themeName;
  final List<GrammarModel> grammars;
  final int grammarLength;
  final int openIndex;
  final String backgroundImage;
  final int sortId;

  BasicGrammarModel({
    required this.uid,
    required this.themeName,
    required this.grammars,
    required this.grammarLength,
    required this.openIndex,
    required this.backgroundImage,
    required this.sortId,
  });

  factory BasicGrammarModel.fromJson(Map<String, dynamic> json) =>
      BasicGrammarModel(
        sortId: json['sort_id'] as int? ?? 0,
        backgroundImage: json['background_image'] as String? ?? '',
        uid: json['uid'] as String? ?? '',
        themeName: json['theme_name'] as String? ?? '',
        grammars: (json['grammars'] as List?)
            ?.map((e) => GrammarModel.fromJson(e))
            .toList() ??
            [],
        grammarLength: json['grammar_length'] as int? ?? 0,
        openIndex: json['open_index'] as int? ?? 0,
      );

  Map<String, dynamic> toJson() => {
    "uid": uid,
    "theme_name": themeName,
    "grammars": grammars.map((e) => e.toJson()).toList(),
    "grammar_length": grammarLength,
    "open_index": openIndex,
    "background_image": backgroundImage,
    'sort_id':sortId,
  };

  Map<String, dynamic> toUpdateJson() => {
    "theme_name": themeName,
    "grammars": grammars.map((e) => e.toJson()).toList(),
    "grammar_length": grammarLength,
    "open_index": openIndex,
    'background_image': backgroundImage,
    'sort_id':sortId,
  };

  BasicGrammarModel copyWith({
    String? uid,
    String? themeName,
    List<GrammarModel>? grammars,
    int? grammarLength,
    String? backgroundImage,
    int? openIndex,
    int? sortId,
  }) =>
      BasicGrammarModel(
        sortId: sortId ?? this.sortId,
        uid: uid ?? this.uid,
        themeName: themeName ?? this.themeName,
        grammars: grammars ?? this.grammars,
        grammarLength: grammarLength ?? this.grammarLength,
        openIndex: openIndex ?? this.openIndex,
        backgroundImage: backgroundImage ?? this.backgroundImage,
      );

  static BasicGrammarModel initialValue() => BasicGrammarModel(
    themeName: '',
    grammars: [],
    grammarLength: 0,
    openIndex: 0,
    uid: '',
    backgroundImage: '',
    sortId: 0,
  );
}