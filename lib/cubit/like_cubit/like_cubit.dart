import 'package:english/cubit/like_cubit/like_state.dart';
import 'package:english/data/model/forms_status.dart';
import 'package:english/data/model/network_response.dart';
import 'package:english/data/model/user/like_dislike/like_dislike_model.dart';
import 'package:english/data/repository/user/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/user/user_model.dart';
import '../../services/services_locator.dart';

class LikeCubit extends Cubit<LikeState> {
  LikeCubit() : super(LikeState.initialValue());

  Future<void> insertLike({required int index, required UserModel userModel}) async {
    emit(state.copyWith(status: FormsStatus.loading));

    List<LikeDislikeModel> likes = List.generate(index + 1, (_) => LikeDislikeModel.initialValue());

    // Yangilangan UserModel'ni chop etish
    UserModel updatedUserModel = userModel.copyWith(likes: likes);
    debugPrint('Updated UserModel: ${updatedUserModel.toUpdateJson()}');

    NetworkResponse response = await getIt<UserRepository>().likeUpdate(userModel: updatedUserModel);
    if (response.errorMessage.isEmpty) {
      emit(state.copyWith(status: FormsStatus.success, likes: likes));
    } else {
      emit(state.copyWith(status: FormsStatus.error, errorMessage: response.errorMessage));
    }
  }

  Future<void> updateLike({required UserModel userData}) async {
    emit(state.copyWith(status: FormsStatus.loading));

    // Yangilangan UserModel'ni chop etish
    debugPrint('Updating UserModel: ${userData.toUpdateJson()}');

    NetworkResponse response = await getIt<UserRepository>().likeUpdate(userModel: userData);
    if (response.errorMessage.isEmpty) {
      emit(state.copyWith(status: FormsStatus.success, likes: userData.likes));
    } else {
      emit(state.copyWith(status: FormsStatus.error, errorMessage: response.errorMessage));
    }
  }
}

