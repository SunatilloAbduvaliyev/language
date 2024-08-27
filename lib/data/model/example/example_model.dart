class ExampleModel {
  final String example;
  final String exampleExplanation;

  ExampleModel({
    required this.example,
    required this.exampleExplanation,
  });

  factory ExampleModel.fromJson(Map<String, dynamic> json) {
    return ExampleModel(
      example: json['example'] as String? ?? '',
      exampleExplanation: json['example_explanation'] as String? ?? '',
    );
  }

  ExampleModel copyWith({
    String? example,
    String? exampleExplanation,
  }) =>
      ExampleModel(
        example: example ?? this.example,
        exampleExplanation: exampleExplanation ?? this.exampleExplanation,
      );

  static ExampleModel initialValue() => ExampleModel(
        example: '',
        exampleExplanation: '',
      );

  Map<String, dynamic> toJson() =>{
    "example":example,
    "example_explanation":exampleExplanation,
  };
}
