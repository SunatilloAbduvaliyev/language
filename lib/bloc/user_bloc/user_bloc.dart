import 'package:english/bloc/user_bloc/user_event.dart';
import 'package:english/bloc/user_bloc/user_state.dart';
import 'package:english/data/model/forms_status.dart';
import 'package:english/data/model/network_response.dart';
import 'package:english/data/model/user/like_dislike/like_dislike_model.dart';
import 'package:english/data/model/user/user_model.dart';
import 'package:english/data/repository/user/user_repository.dart';
import 'package:english/services/services_locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState.initialValue()) {
    on<InsertUserEvent>(_insertUser);
    on<FetchAllUserEvent>(_fetchAllUser);
    on<FetchUserEvent>(_fetUser);
    on<UpdateLikeUserEvent>(_likeUpdate);
    on<LoginInsertLikeUserEvent>(_loginLikeInsert);
  }

  Future<void> _insertUser(
      InsertUserEvent event, Emitter<UserState> emit) async {
    emit(state.copyWith(status: FormsStatus.loading));
    UserModel userModel = event.insertUserData;
    List<LikeDislikeModel> likes = [];
    if (event.isGrammarSuccess) {
      for (int i = 0; i <= event.grammarLikes.length-1; i++) {
        LikeDislikeModel likeModel = LikeDislikeModel.initialValue();
        likeModel = likeModel.copyWith(
          contentId: event.grammarLikes[i].themeId,
          contentUid: event.grammarLikes[i].docId,
        );
        likes.add(likeModel);
      }
      likes.sort((a, b) => a.contentId.compareTo(b.contentId));
      userModel = userModel.copyWith(likes: likes);
    }
    NetworkResponse response =
        await getIt<UserRepository>().insertUser(userModel: userModel);
    if (response.errorMessage.isEmpty) {
      emit(
        state.copyWith(
          status: FormsStatus.success,
          userData: response.data,
          isGrammarSuccess: event.isGrammarSuccess,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: FormsStatus.error,
          errorMessage: response.errorMessage,
        ),
      );
    }
  }

  Future<void> _fetchAllUser(FetchAllUserEvent event,
      Emitter<UserState> emit) async {
    emit(state.copyWith(status: FormsStatus.loading));
    NetworkResponse response = await getIt<UserRepository>().fetchAllUsers();
    if (response.errorMessage.isEmpty) {
      emit(
        state.copyWith(
          status: FormsStatus.success,
          allUserData: response.data,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: FormsStatus.error,
          errorMessage: response.errorMessage,
        ),
      );
    }
  }

  Future<void> _fetUser(FetchUserEvent event, Emitter<UserState> emit) async {
    emit(state.copyWith(status: FormsStatus.loading));
    NetworkResponse response =
        await getIt<UserRepository>().fetchDocIdUser(docId: event.userDocId);
    if (response.errorMessage.isEmpty) {
      emit(
        state.copyWith(
          status: FormsStatus.success,
          userData: response.data,
          isGrammarSuccess: event.isGrammarSuccess,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: FormsStatus.error,
          errorMessage: response.errorMessage,
        ),
      );
    }
  }

  Future<void> _likeUpdate(
      UpdateLikeUserEvent event, Emitter<UserState> emit) async {
    Set<int> newLoadingIndex = Set.from(state.loadingIndex);
    newLoadingIndex.add(event.index);
    emit(
      state.copyWith(
        status: FormsStatus.updateLoading,
        loadingIndex: newLoadingIndex,
      ),
    );
    UserModel userModel = event.userModel;
    List<LikeDislikeModel> likes = event.like;
    likes.removeAt(event.index);
    likes.insert(event.index, event.likeDislikeModel);
    userModel = userModel.copyWith(
      likes: likes,
      uid: userModel.uid,
    );
    debugPrint(
        "user uid like update ____________________________ ${userModel.uid}");
    NetworkResponse response =
        await getIt<UserRepository>().likeUpdate(userModel: userModel);
    if (response.errorMessage.isEmpty) {
      Set<int> newLoadingIndex = Set.from(state.loadingIndex);
      newLoadingIndex.remove(event.index);
      emit(
        state.copyWith(
          status: FormsStatus.success,
          userData: response.data,
          loadingIndex: newLoadingIndex,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: FormsStatus.error,
          errorMessage: response.errorMessage,
        ),
      );
    }
  }

  Future<void> _loginLikeInsert(
      LoginInsertLikeUserEvent event, Emitter<UserState> emit) async {
    emit(state.copyWith(status: FormsStatus.loading));
    NetworkResponse response = await getIt<UserRepository>().loginLikeInsert(
      userUid: event.userUid,
      grammarData: event.grammarData,
    );
    if (response.errorMessage.isEmpty) {
      emit(
        state.copyWith(
          status: FormsStatus.success,
          userData: response.data,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: FormsStatus.error,
          errorMessage: response.errorMessage,
        ),
      );
    }
  }
}
