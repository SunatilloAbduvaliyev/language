import '../../data/model/forms_status.dart';
import '../../data/model/user/like_dislike/like_dislike_model.dart';

class LikeState {
  final String errorMessage;
  final List<LikeDislikeModel> likes;
  final FormsStatus status;

  LikeState(
      {required this.errorMessage, required this.likes, required this.status});

  LikeState copyWith({
    String? errorMessage,
    List<LikeDislikeModel>? likes,
    FormsStatus? status,
  }) =>
      LikeState(
        errorMessage: errorMessage ?? this.errorMessage,
        likes: likes ?? this.likes,
        status: status ?? this.status,
      );

  static LikeState initialValue() => LikeState(
        errorMessage: '',
        likes: [],
        status: FormsStatus.pure,
      );
}
