import 'package:english/data/model/forms_status.dart';
import 'package:english/data/model/word/word_model.dart';

import '../../data/model/user/user_model.dart';

class UserState {
  final String errorMessage;
  final FormsStatus status;
  final UserModel userData;
  final List<UserModel> allUserData;
  final bool isGrammarSuccess;
  final Set<int> loadingIndex;
  final List<WordModel> favouriteWord;

  UserState({
    required this.favouriteWord,
    required this.errorMessage,
    required this.status,
    required this.userData,
    required this.allUserData,
    required this.isGrammarSuccess,
    required this.loadingIndex,
  });

  UserState copyWith({
    String? errorMessage,
    FormsStatus? status,
    UserModel? userData,
    List<UserModel>? allUserData,
    bool? isGrammarSuccess,
    Set<int>? loadingIndex,
    List<WordModel>? favouriteWord,
  }) {
    return UserState(
      favouriteWord: favouriteWord ?? this.favouriteWord,
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
      userData: userData ?? this.userData,
      allUserData: allUserData ?? this.allUserData,
      isGrammarSuccess: isGrammarSuccess ?? this.isGrammarSuccess,
      loadingIndex:  loadingIndex ?? this.loadingIndex,
    );
  }

  static UserState initialValue() => UserState(
        favouriteWord: [],
        errorMessage: '',
        status: FormsStatus.pure,
        userData: UserModel.initialValue(),
        allUserData: [],
        isGrammarSuccess: false,
        loadingIndex: {}
      );
}
