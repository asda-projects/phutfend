class AuthErrorHandling {
  static String getErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'invalid-email':
        return 'The email address is not valid.';

      case 'user-disabled':
        return 'The user corresponding to the given email has been disabled.';

      case 'user-not-found':
        return 'There is no user corresponding to the given email.';

      case 'wrong-password':
        return 'The password is invalid for the given email.';
      case 'network-request-failed':
        return 'Please check your internet configurations, and try again.';
      default:
        return 'An unknown error occurred. Please try again later.';
    }
  }
}
