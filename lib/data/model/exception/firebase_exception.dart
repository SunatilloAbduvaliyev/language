class SignUpWithEmailAndPasswordFailure implements Exception {
  const SignUpWithEmailAndPasswordFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  factory SignUpWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure(
          'invalid_email',
        );
      case 'user-disabled':
        return const SignUpWithEmailAndPasswordFailure(
          'user_disabled',
        );
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure(
          'email_already_in_use',
        );
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure(
          'operation_not_allowed',
        );
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure(
          'weak_password',
        );
      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }

  final String message;
}

class LogInWithEmailAndPasswordFailure implements Exception {
  const LogInWithEmailAndPasswordFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  factory LogInWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const LogInWithEmailAndPasswordFailure(
          'invalid_email',
        );
      case 'user-disabled':
        return const LogInWithEmailAndPasswordFailure(
          'user_disabled',
        );
      case 'user-not-found':
        return const LogInWithEmailAndPasswordFailure(
          'user_not_found',
        );
      case 'wrong-password':
        return const LogInWithEmailAndPasswordFailure(
          'wrong_password',
        );
      case 'invalid-credential':
        return const LogInWithEmailAndPasswordFailure(
          'invalid_credential',
        );
      default:
        return LogInWithEmailAndPasswordFailure(code);
    }
  }

  final String message;
}

class LogInWithGoogleFailure implements Exception {
  const LogInWithGoogleFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  factory LogInWithGoogleFailure.fromCode(String code) {
    switch (code) {
      case 'account-exists-with-different-credential':
        return const LogInWithGoogleFailure(
          'account_exists_with_different_credential',
        );
      case 'invalid-credential':
        return const LogInWithGoogleFailure(
          'invalid_credential',
        );
      case 'operation-not-allowed':
        return const LogInWithGoogleFailure(
          'operation_not_allowed',
        );
      case 'user-disabled':
        return const LogInWithGoogleFailure(
          'user_disabled',
        );
      case 'user-not-found':
        return const LogInWithGoogleFailure(
          'user_not_found',
        );
      case 'wrong-password':
        return const LogInWithGoogleFailure(
          'wrong_password',
        );
      case 'invalid-verification-code':
        return const LogInWithGoogleFailure(
          'invalid_verification_code',
        );
      case 'invalid-verification-id':
        return const LogInWithGoogleFailure(
          '',
        );
      default:
        return const LogInWithGoogleFailure();
    }
  }

  final String message;
}

class LogOutFailure implements Exception {}