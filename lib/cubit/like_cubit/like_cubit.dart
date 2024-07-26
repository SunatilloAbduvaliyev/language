import 'package:english/cubit/like_cubit/like_state.dart';
import 'package:english/data/model/forms_status.dart';
import 'package:english/data/model/grammar/grammar_model.dart';
import 'package:english/data/model/network_response.dart';
import 'package:english/data/model/user/like_dislike/like_dislike_model.dart';
import 'package:english/data/repository/user/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/user/user_model.dart';
import '../../services/services_locator.dart';

class LikeCubit extends Cubit<LikeState> {
  LikeCubit() : super(LikeState.initialValue());

  Future<void> insertLike({
    required UserModel userModel,
    required List<GrammarModel> grammarData,
  }) async {
    emit(state.copyWith(status: FormsStatus.loading));
    List<LikeDislikeModel> likes = [];
    for (int i = 0; i <= grammarData.length - 1; i++) {
      LikeDislikeModel likeDislikeModel = LikeDislikeModel.initialValue();
      likeDislikeModel = likeDislikeModel.copyWith(
        contentName: grammarData[i].subjectName,
      );
      likes.add(likeDislikeModel);
    }

    // Yangilangan UserModel'ni chop etish
    UserModel updatedUserModel = userModel.copyWith(likes: likes);
    debugPrint('Updated UserModel: ${updatedUserModel.toUpdateJson()}');

    NetworkResponse response = await getIt<UserRepository>().likeUpdate(userModel: updatedUserModel);
    if (response.errorMessage.isEmpty) {
      emit(
        state.copyWith(
          status: FormsStatus.success,
          likes: likes,
          userModel: userModel,
          insertLike: true,
        ),
      );
    } else {
      emit(state.copyWith(status: FormsStatus.error, errorMessage: response.errorMessage));
    }
  }

  Future<void> updateLike({
    required UserModel userData,
    required LikeDislikeModel likesModel,
    required int index,
    bool? isLike,
    bool? disLike,
  }) async {
    emit(state.copyWith(status: FormsStatus.loading));
    likesModel = likesModel.copyWith(
      like: isLike,
      disLike: disLike,
    );
    List<LikeDislikeModel> likes = userData.likes;
    debugPrint(
        "__________________________________________ length ${likes.length.toString()}: Index ${index.toString()}");
    likes.removeAt(index);
    likes.insert(index, likesModel);
    userData = userData.copyWith(
      likes: likes,
    );
    // Yangilangan UserModel'ni chop etish
    debugPrint('Updating UserModel: ${userData.toUpdateJson()}');

    NetworkResponse response = await getIt<UserRepository>().likeUpdate(userModel: userData);
    if (response.errorMessage.isEmpty) {
      emit(state.copyWith(status: FormsStatus.success, likes: userData.likes));
    } else {
      emit(state.copyWith(status: FormsStatus.error, errorMessage: response.errorMessage));
    }
  }

  void insertLikeFinish(){
    emit(state.copyWith(insertLike: false));
  }
}

