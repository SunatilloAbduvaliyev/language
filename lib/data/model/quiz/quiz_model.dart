class QuizModel {
  final String question;
  final List<String> variants;
  final String checkVariant;
  final String trueAnswer;

  QuizModel({
    required this.question,
    required this.variants,
    required this.checkVariant,
    required this.trueAnswer,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
    question: json['question'] as String? ?? '',
    variants: (json['variants'] as List<dynamic>).cast<String>() ?? [],
    checkVariant: json['check_variant'] as String? ?? '',
    trueAnswer: json['true_answer'] as String? ?? '',
  );

  Map<String, dynamic> toJson() => {
    "question": question,
    "variants": variants,
    "check_variant": checkVariant,
    "true_answer": trueAnswer,
  };

  QuizModel copyWith({
    String? question,
    String? checkVariant,
    String? trueAnswer,
    List<String>? variants,
  }) =>
      QuizModel(
        question: question ?? this.question,
        variants: variants ?? this.variants,
        checkVariant: checkVariant ?? this.checkVariant,
        trueAnswer: trueAnswer ?? this.trueAnswer,
      );

  static QuizModel initialValue() => QuizModel(
    question: '',
    variants: [],
    checkVariant: '',
    trueAnswer: '',
  );
}