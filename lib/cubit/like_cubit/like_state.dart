import '../../data/model/forms_status.dart';
import '../../data/model/user/like_dislike/like_dislike_model.dart';
import '../../data/model/user/user_model.dart';

class LikeState {
  final String errorMessage;
  final List<LikeDislikeModel> likes;
  final FormsStatus status;
  final UserModel userModel;
  final bool insertLike;
  LikeState({
    required this.errorMessage,
    required this.likes,
    required this.status,
    required this.userModel,
    required this.insertLike,
  });

  LikeState copyWith({
    String? errorMessage,
    List<LikeDislikeModel>? likes,
    FormsStatus? status,
    UserModel? userModel,
    bool? insertLike,
  }) =>
      LikeState(
        errorMessage: errorMessage ?? this.errorMessage,
        likes: likes ?? this.likes,
        status: status ?? this.status,
        userModel: userModel ?? this.userModel,
        insertLike: insertLike ?? this.insertLike,
      );

  static LikeState initialValue() => LikeState(
        errorMessage: '',
        likes: [],
        status: FormsStatus.pure,
        userModel: UserModel.initialValue(),
        insertLike: false,
      );
}
