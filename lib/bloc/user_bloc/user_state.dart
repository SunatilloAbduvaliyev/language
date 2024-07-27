import 'package:english/data/model/forms_status.dart';

import '../../data/model/user/user_model.dart';

class UserState {
  final String errorMessage;
  final FormsStatus status;
  final UserModel userData;
  final List<UserModel> allUserData;
  final bool isGrammarSuccess;

  UserState({
    required this.errorMessage,
    required this.status,
    required this.userData,
    required this.allUserData,
    required this.isGrammarSuccess,
  });

  UserState copyWith({
    String? errorMessage,
    FormsStatus? status,
    UserModel? userData,
    List<UserModel>? allUserData,
    bool? isGrammarSuccess,
  }) {
    return UserState(
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
      userData: userData ?? this.userData,
      allUserData: allUserData ?? this.allUserData,
      isGrammarSuccess: isGrammarSuccess ?? this.isGrammarSuccess,
    );
  }

  static UserState initialValue() => UserState(
        errorMessage: '',
        status: FormsStatus.pure,
        userData: UserModel.initialValue(),
        allUserData: [],
        isGrammarSuccess: false,
      );
}
