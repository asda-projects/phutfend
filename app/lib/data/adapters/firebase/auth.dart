

import 'package:app/settings/logs.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthResponse {
  final bool error;
  final User? user;
  final String responseStatus;
  final dynamic data;

  AuthResponse(
      {this.data = const {}, required this.user, required this.error, required this.responseStatus});
}


class AuthResponseMessages {
  // Define a map for error messages
  static const Map<String, String> _messages = {
    // bussiness logic messages
    'successful-auth': 'successful authentication.',
    'missing-password': 'Please provide a password.',
    'user-disabled': 'The user corresponding to the given email has been disabled.',

    'wrong-password': 'The password is invalid for the given user.',
    'network-request-failed': 'Please check your internet configurations, and try again.',
    'unknown-error': 'An unknown error occurred. Please try again later.',
    'missing-credentials-bussiness-logic': 'Report this issue to your administrator.',
    'invalid-credential':'Invalid credentials, Report this issue to your administrator.',

    // firebase messages
    "claims-too-large": "The claim size exceeds the limit. Please reduce the claim size.",
  "email-already-exists": "This email is already in use. Please use a different email.",
  "id-token-expired": "Your session has expired. Please log in again.",
  "id-token-revoked": "Your session has been revoked. Please log in again.",
  "insufficient-permission": "Insufficient permissions to perform this action. Please check your permissions.",
  "internal-error": "An unexpected error occurred. Please try again later.",
  "invalid-argument": "An invalid argument was provided. Please check your input.",
  "invalid-claims": "Invalid custom claims. Please check the provided claims.",
  "invalid-continue-uri": "Invalid continue URL. Please provide a valid URL.",
  "invalid-creation-time": "Invalid creation time. Please provide a valid UTC date.",
  "invalid-disabled-field": "Invalid value for the disabled field. It must be a boolean.",
  "invalid-display-name": "Invalid display name. It must be a non-empty string.",
  "invalid-dynamic-link-domain": "Invalid dynamic link domain. Please check your configuration.",
  "invalid-email": "Invalid email address. Please provide a valid email.",
  "invalid-email-verified": "Invalid value for email verified. It must be a boolean.",
  "invalid-hash-algorithm": "Unsupported hash algorithm. Please use a supported algorithm.",
  "invalid-hash-block-size": "Invalid hash block size. Please provide a valid number.",
  "invalid-hash-derived-key-length": "Invalid hash derived key length. Please provide a valid number.",
  "invalid-hash-key": "Invalid hash key. Please provide a valid byte buffer.",
  "invalid-hash-memory-cost": "Invalid hash memory cost. Please provide a valid number.",
  "invalid-hash-parallelization": "Invalid hash parallelization. Please provide a valid number.",
  "invalid-hash-rounds": "Invalid hash rounds. Please provide a valid number.",
  "invalid-hash-salt-separator": "Invalid hash salt separator. Please provide a valid byte buffer.",
  "invalid-id-token": "Invalid ID token. Please provide a valid Firebase ID token.",
  "invalid-last-sign-in-time": "Invalid last sign-in time. Please provide a valid UTC date.",
  "invalid-page-token": "Invalid page token. Please provide a valid non-empty string.",
  "invalid-password": "Invalid password. It must be at least six characters.",
  "invalid-password-hash": "Invalid password hash. Please provide a valid byte buffer.",
  "invalid-password-salt": "Invalid password salt. Please provide a valid byte buffer.",
  "invalid-phone-number": "Invalid phone number. Please provide a valid E.164 phone number.",
  "invalid-photo-url": "Invalid photo URL. Please provide a valid URL.",
  "invalid-provider-data": "Invalid provider data. Please provide a valid array of UserInfo objects.",
  "invalid-provider-id": "Invalid provider ID. Please provide a valid supported provider identifier.",
  "invalid-oauth-responsetype": "Only one OAuth response type should be true.",
  "invalid-session-cookie-duration": "Invalid session cookie duration. It must be between 5 minutes and 2 weeks.",
  "invalid-uid": "Invalid UID. It must be a non-empty string with at most 128 characters.",
  "invalid-user-import": "Invalid user record to import. Please check the user data.",
  "maximum-user-count-exceeded": "Maximum user count exceeded. Please reduce the number of users to import.",
  "missing-android-pkg-name": "Missing Android package name. Please provide the package name.",
  "missing-continue-uri": "Missing continue URL. Please provide a valid URL.",
  "missing-hash-algorithm": "Missing hash algorithm. Please provide the hashing algorithm and parameters.",
  "missing-ios-bundle-id": "Missing iOS bundle ID. Please provide the bundle ID.",
  "missing-uid": "Missing UID. Please provide a UID for the operation.",
  "missing-oauth-client-secret": "Missing OAuth client secret. Please provide the client secret for OIDC code flow.",
  "operation-not-allowed": "Sign-in provider is disabled. Please enable it in the Firebase console.",
  "phone-number-already-exists": "This phone number is already in use. Please use a different phone number.",
  "project-not-found": "No Firebase project found. Please check your Firebase project credentials.",
  "reserved-claims": "One or more custom claims are reserved. Please use different keys for custom claims.",
  "session-cookie-expired": "Session cookie expired. Please log in again.",
  "session-cookie-revoked": "Session cookie revoked. Please log in again.",
  "too-many-requests": "Too many requests. Please try again later.",
  "uid-already-exists": "This UID is already in use. Please use a different UID.",
  "unauthorized-continue-uri": "Unauthorized continue URL. Please whitelist the domain in the Firebase console.",
  "user-not-found": "No user found with the provided identifier. Please check the user ID.",
  };

  static Map<String, String> get responseStatus => _messages;
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