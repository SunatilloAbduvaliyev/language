import 'package:english/data/model/user/user_model.dart';
import 'package:equatable/equatable.dart';

import '../../data/model/grammar/grammar_model.dart';
import '../../data/model/user/like_dislike/like_dislike_model.dart';

abstract class UserEvent {}

class InsertUserEvent extends UserEvent with EquatableMixin {
  final UserModel insertUserData;
  final bool isGrammarSuccess;
  final List<GrammarModel> grammarLikes;

  InsertUserEvent({
    required this.insertUserData,
    required this.isGrammarSuccess,
    required this.grammarLikes,
  });

  @override
  List<Object?> get props => [
        insertUserData,
        isGrammarSuccess,
        grammarLikes,
      ];
}

class FetchUserEvent extends UserEvent with EquatableMixin {
  final String userDocId;
  final bool isGrammarSuccess;

  FetchUserEvent({
    required this.userDocId,
    this.isGrammarSuccess = false,
  });

  @override
  List<Object?> get props => [
        userDocId,
        isGrammarSuccess,
      ];
}

class FetchAllUserEvent extends UserEvent {}

class UpdateLikeUserEvent extends UserEvent with EquatableMixin {
  final UserModel userModel;
  final List<LikeDislikeModel> like;
  final int index;
  final LikeDislikeModel likeDislikeModel;

  UpdateLikeUserEvent({
    required this.userModel,
    required this.like,
    required this.index,
    required this.likeDislikeModel,
  });

  @override
  List<Object?> get props => [
        userModel,
        like,
        index,
        likeDislikeModel,
      ];
}

class LoginInsertLikeUserEvent extends UserEvent with EquatableMixin{
  final String userUid;
  final List<GrammarModel> grammarData;

  LoginInsertLikeUserEvent({
    required this.userUid,
    required this.grammarData,
  });


  @override
  List<Object?> get props => [
    userUid,
    grammarData,
  ];
}

class UserUpdateEvent extends UserEvent{
  final UserModel userModel;
  UserUpdateEvent({required this.userModel});
}

class UserInitialEvent extends UserEvent{}
