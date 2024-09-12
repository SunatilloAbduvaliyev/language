import '../like_dislike/like_dislike_model.dart';
class MainLikeModel {
  final String uid;
  final List<LikeDislikeModel> likes;

  MainLikeModel({
    required this.uid,
    required this.likes,
  });

  factory MainLikeModel.fromJson(Map<String, dynamic> json) => MainLikeModel(
    uid: json['uid'] as String? ?? ' ',
    likes: (json['like_dislikes'] as List<dynamic>?)
        ?.map((e) => LikeDislikeModel.fromJson(e))
        .toList() ??
        [],
  );

  Map<String, dynamic> toJson() => {
    "uid": "Oxh6VznzNwRT6XecYPCQ",
    "like_dislikes": likes.map((e) => e.toJson()),
  };

  MainLikeModel copyWith({
    String? uid,
    List<LikeDislikeModel>? likes,
  }) =>
      MainLikeModel(
        uid: uid ?? this.uid,
        likes: likes ?? this.likes,
      );

  static MainLikeModel initialValue() => MainLikeModel(
    uid: '',
    likes: [],
  );
}