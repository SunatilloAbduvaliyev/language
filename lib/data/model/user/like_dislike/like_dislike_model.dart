class LikeDislikeModel {
  final int contentId;
  final bool like;
  final bool disLike;
  final String contentUid;

  LikeDislikeModel({
    required this.like,
    required this.disLike,
    required this.contentId,
    required this.contentUid,
  });

  factory LikeDislikeModel.fromJson(Map<String, dynamic> json) {
    return LikeDislikeModel(
      like: json['like'] as bool? ?? false,
      disLike: json['dis_like'] as bool? ?? false,
      contentId: json['content_id'] as int? ?? 0,
      contentUid: json['content_uid'] as String? ?? ''
    );
  }

  LikeDislikeModel copyWith({
    bool? like,
    bool? disLike,
    int? contentId,
    String? contentUid,
  }) {
    return LikeDislikeModel(
      like: like ?? this.like,
      disLike: disLike ?? this.disLike,
      contentId: contentId ?? this.contentId,
      contentUid: contentUid ?? this.contentUid,
    );
  }

  static LikeDislikeModel initialValue() => LikeDislikeModel(
        like: false,
        disLike: false,
        contentId: 0,
        contentUid: '',
      );

  Map<String, dynamic> toJson()=>{
    'like':like,
    'dis_like':disLike,
    'content_id':contentId,
    "content_uid":contentUid,
  };
}
