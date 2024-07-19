import 'package:firebase_auth/firebase_auth.dart';
import '../../data/model/forms_status.dart';

class AuthState {
  final FormsStatus status;
  final String errorMessage;
  final User? user;
  final bool isGoogle;

  AuthState({
    required this.status,
    required this.errorMessage,
    required this.user,
    required this.isGoogle,
  });

  AuthState copyWith({
    FormsStatus? status,
    String? errorMessage,
    User? user,
    bool? isGoogle,
  }) {
    return AuthState(
      user: user ?? this.user,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      isGoogle: isGoogle ?? this.isGoogle,
    );
  }

  static AuthState initialValue() => AuthState(
    status: FormsStatus.pure,
    errorMessage: '',
    user: null,
    isGoogle: false,
  );
}