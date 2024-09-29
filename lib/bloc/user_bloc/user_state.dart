import 'package:english/data/model/forms_status.dart';
import 'package:english/data/model/word/word_model.dart';

import '../../data/model/user/user_model.dart';

class UserState {
  final String errorMessage;
  final FormsStatus status;
  final UserModel userData;
  final List<UserModel> allUserData;
  final Set<int> loadingIndex;
  final List<WordModel> favouriteWord;
  final Set<int> favouriteWordLoading;


  UserState({
    required this.favouriteWord,
    required this.errorMessage,
    required this.status,
    required this.userData,
    required this.allUserData,
    required this.loadingIndex,
    required this.favouriteWordLoading,
  });

  UserState copyWith({
    String? errorMessage,
    FormsStatus? status,
    UserModel? userData,
    List<UserModel>? allUserData,
    bool? isGrammarSuccess,
    Set<int>? loadingIndex,
    List<WordModel>? favouriteWord,
    Set<int>? favouriteWordLoading,
  }) {
    return UserState(
      favouriteWordLoading: favouriteWordLoading ?? this.favouriteWordLoading,
      favouriteWord: favouriteWord ?? this.favouriteWord,
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
      userData: userData ?? this.userData,
      allUserData: allUserData ?? this.allUserData,
      loadingIndex:  loadingIndex ?? this.loadingIndex,
    );
  }

  static UserState initialValue() => UserState(
        favouriteWordLoading: {},
        favouriteWord: [],
        errorMessage: '',
        status: FormsStatus.pure,
        userData: UserModel.initialValue(),
        allUserData: [],
        loadingIndex: {}
      );
}
