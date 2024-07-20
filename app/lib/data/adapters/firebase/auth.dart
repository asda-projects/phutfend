

import 'package:app/settings/logs.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthResponse {
  final bool error;
  final User? user;
  final String responseStatus;

  AuthResponse(
      {required this.user, required this.error, required this.responseStatus});
}


class AuthResponseMessages {
  // Define a map for error messages
  static const Map<String, String> messages = {
    'successful-auth': 'successful authentication.',
    'invalid-email': 'The email address is not valid.',
    'user-disabled':
        'The user corresponding to the given email has been disabled.',
    'user-not-found': 'There is no user corresponding to the given email.',
    'wrong-password': 'The password is invalid for the given email.',
    'network-request-failed':
        'Please check your internet configurations, and try again.',
    'unknown-error': 'An unknown error occurred. Please try again later.',
  };

  static Map<String, String> get responseStatus => messages;
}

class AuthUser {

  final FirebaseAuth fireauth = FirebaseAuth.instance;

  AppLogger logger = AppLogger();


  Future<AuthResponse> byEmailPwd(String email, String password) async {
    try {
      UserCredential userCredential = await fireauth.signInWithEmailAndPassword(email: email, password: password);
      var user = userCredential.user;
      logger.debug('Signed in...');
      
      return AuthResponse(user: user, error: false, responseStatus: AuthResponseMessages.responseStatus["successful-auth"]!);
    } on FirebaseAuthException catch (e) {
      logger.debug('Failed to sign in: ${e.code}');
      return AuthResponse(user: null, error: true, responseStatus: AuthResponseMessages.responseStatus[e.code]!);
    } catch (e) {
      logger.debug('Failed to sign in: $e');
      return AuthResponse(user: null, error: true, responseStatus: AuthResponseMessages.responseStatus["unknown-error"]!);
    }
  }

    




}