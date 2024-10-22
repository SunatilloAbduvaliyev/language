class QuizModel {
  final String question;
  final List<String> variants;
  final String checkVariant;
  final String trueAnswer;
  final bool isDraggable;

  QuizModel({
    required this.question,
    required this.variants,
    required this.checkVariant,
    required this.trueAnswer,
    required this.isDraggable,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
    isDraggable: json['is_draggable'] as bool? ?? false,
    question: json['question'] as String? ?? '',
    variants: (json['variants'] != null && json['variants'] is List)
        ? (json['variants'] as List).cast<String>()
        : [],
    checkVariant: json['check_variant'] as String? ?? '',
    trueAnswer: json['true_answer'] as String? ?? '',
  );

  Map<String, dynamic> toJson() => {
    "question": question,
    "variants": variants,
    "check_variant": checkVariant,
    "true_answer": trueAnswer,
    "is_draggable": isDraggable,
  };

  QuizModel copyWith({
    String? question,
    List<String>? variants,
    String? checkVariant,
    String? trueAnswer,
    List<List<String>>? draggableWords,
    bool? isDraggable,
  }) {
    return QuizModel(
      question: question ?? this.question,
      variants: variants ?? this.variants,
      checkVariant: checkVariant ?? this.checkVariant,
      trueAnswer: trueAnswer ?? this.trueAnswer,
      isDraggable: isDraggable ?? this.isDraggable,
    );
  }

  static QuizModel initialValue() => QuizModel(
    question: '',
    variants: [],
    checkVariant: '',
    trueAnswer: '',
    isDraggable: false,
  );
}
