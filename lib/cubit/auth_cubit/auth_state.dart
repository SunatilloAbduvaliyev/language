import 'package:firebase_auth/firebase_auth.dart';
import '../../data/model/forms_status.dart';

class AuthState {
  final FormsStatus status;
  final String errorMessage;
  final User? user;

  AuthState({
    required this.status,
    required this.errorMessage,
    required this.user,
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
    );
  }

  static AuthState initialValue() => AuthState(
    status: FormsStatus.pure,
    errorMessage: '',
    user: null,
  );
}