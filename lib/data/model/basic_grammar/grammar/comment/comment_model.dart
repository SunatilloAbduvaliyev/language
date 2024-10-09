class CommentModel {
  final String comment;
  final int level;

  CommentModel({
    required this.comment,
    required this.level,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        comment: json['comment'] as String? ?? '',
        level: json['level'] as int? ?? 0,
      );

  CommentModel copyWith({
    String? comment,
    int? level,
  }) =>
      CommentModel(
        comment: comment ?? this.comment,
        level: level ?? this.level,
      );

  static CommentModel initialValue() => CommentModel(
        comment: '',
        level: 0,
      );

  Map<String, dynamic> toJson() => {
        'comment': comment,
        'level': level,
      };
}
