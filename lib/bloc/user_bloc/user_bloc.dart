import 'package:english/bloc/user_bloc/user_event.dart';
import 'package:english/bloc/user_bloc/user_state.dart';
import 'package:english/data/model/forms_status.dart';
import 'package:english/data/model/network_response.dart';
import 'package:english/data/model/user/user_model.dart';
import 'package:english/data/model/word/word_model.dart';
import 'package:english/data/repository/user/user_repository.dart';
import 'package:english/services/services_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState.initialValue()) {
    on<InsertUserEvent>(_insertUser);
    on<FetchAllUserEvent>(_fetchAllUser);
    on<FetchUserEvent>(_fetUser);
    on<UserUpdateEvent>(_updateUser);
    on<UserInitialEvent>(_initialState);
    on<UserLikeWordUpdateEvent>(_updateLikeWord);
    on<UserWordDeleteEvent>(_deleteWord);
  }

  Future<void> _insertUser(
      InsertUserEvent event, Emitter<UserState> emit) async {
    emit(state.copyWith(status: FormsStatus.loading));
    NetworkResponse response = await getIt<UserRepository>()
        .insertUser(userModel: event.insertUserData);
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

  Future<void> _fetchAllUser(
      FetchAllUserEvent event, Emitter<UserState> emit) async {
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



  Future<void> _updateUser(
      UserUpdateEvent event, Emitter<UserState> emit) async {
    emit(state.copyWith(status: FormsStatus.loading));
    NetworkResponse response =
        await getIt<UserRepository>().userUpdate(userModel: event.userModel);
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

  Future<void> _updateLikeWord(
      UserLikeWordUpdateEvent event, Emitter<UserState> emit) async {
    Set<int> newLoadingIndex = Set.from(state.favouriteWordLoading);
    newLoadingIndex.add(event.index);
    emit(
      state.copyWith(
        favouriteWordLoading: newLoadingIndex,
      ),
    );
    List<WordModel> likeWords = event.userModel.favouriteWords;
    Map<String, String> checkLike = event.userModel.checkLike;
    UserModel updateUser = event.userModel;
    if (event.isTrue) {
      for (int i = 0; i < event.userModel.favouriteWords.length; i++) {
        if (likeWords[i].english == event.wordModel.english &&
            likeWords[i].translateWord == event.wordModel.translateWord) {
          checkLike.remove(likeWords[i].english);
          likeWords.removeAt(i);
          break;
        }
      }
      updateUser = updateUser.copyWith(
        checkLike: checkLike,
        favouriteWords: likeWords,
      );
    } else {
      likeWords.add(event.wordModel);
      checkLike.putIfAbsent(
        event.wordModel.english,
        () => event.wordModel.english,
      );
      updateUser = updateUser.copyWith(
        checkLike: checkLike,
        favouriteWords: likeWords,
      );
    }
    NetworkResponse response =
        await getIt<UserRepository>().userUpdate(userModel: updateUser);
    Set<int> loadingIndex = Set.from(state.favouriteWordLoading);
    loadingIndex.remove(event.index);
    if (response.errorMessage.isEmpty) {
      emit(
        state.copyWith(
          status: FormsStatus.success,
          userData: updateUser,
          favouriteWord: updateUser.favouriteWords,
          favouriteWordLoading: loadingIndex,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: FormsStatus.error,
          errorMessage: response.errorMessage,
          favouriteWordLoading: loadingIndex,
        ),
      );
    }
  }

  Future<void> _deleteWord(
      UserWordDeleteEvent event, Emitter<UserState> emit) async {
    Set<int> newLoadingIndex = Set.from(state.wordDeleteLoading);
    newLoadingIndex.add(event.index);
    emit(
      state.copyWith(
        wordDeleteLoading: newLoadingIndex,
      ),
    );
    UserModel userModel = event.userData;
    List<WordModel> words = [];
    Map<String, String> checkLike = userModel.checkLike;
    if (event.isFavourite) {
      words = userModel.favouriteWords;
      checkLike.remove(userModel.favouriteWords[event.index].english);
      words.removeAt(event.index);
      userModel = userModel.copyWith(
        favouriteWords: words,
        checkLike: checkLike,
      );
    } else {
      words = userModel.words;
      words.removeAt(event.index);
      userModel = userModel.copyWith(
        words: words,
      );
    }

    NetworkResponse response =
        await getIt<UserRepository>().userUpdate(userModel: userModel);
    Set<int> loadingIndex = Set.from(state.wordDeleteLoading);
    loadingIndex.remove(event.index);
    if (response.errorMessage.isEmpty) {
      emit(
        state.copyWith(
          wordDeleteLoading: loadingIndex,
          userData: userModel,
        ),
      );
    }else{
      emit(
        state.copyWith(
          wordDeleteLoading: loadingIndex,
          status: FormsStatus.error,
          errorMessage: response.errorMessage,
        ),
      );
    }
  }

  void _initialState(UserInitialEvent event, Emitter<UserState> emit) => emit(
        state.copyWith(
          status: FormsStatus.success,
        ),
      );
}
