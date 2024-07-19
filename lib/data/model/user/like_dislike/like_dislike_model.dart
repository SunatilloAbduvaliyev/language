class LikeDislikeModel {
  final String contentName;
  final bool like;
  final bool disLike;

  LikeDislikeModel({
    required this.like,
    required this.disLike,
    required this.contentName,
  });

  factory LikeDislikeModel.fromJson(Map<String, dynamic> json) {
    return LikeDislikeModel(
      like: json['like'] as bool? ?? false,
      disLike: json['dis_like'] as bool? ?? false,
      contentName: json['content_name'] as String? ?? '',
    );
  }

  LikeDislikeModel copyWith({
    bool? like,
    bool? disLike,
    String? contentName,
  }) {
    return LikeDislikeModel(
      like: like ?? this.like,
      disLike: disLike ?? this.disLike,
      contentName: contentName ?? this.contentName,
    );
  }

  static LikeDislikeModel initialValue() => LikeDislikeModel(
        like: false,
        disLike: false,
        contentName: '',
      );

  Map<String, dynamic> toJson()=>{
    'like':like,
    'dis_like':disLike,
    'content_name':contentName,
  };
}
