import 'package:app/settings/logs.dart';
import 'package:firebase_auth/firebase_auth.dart';

AppLogger logger = AppLogger();

class UserFireBaseService {
  authUserByEmailPwd(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      var user = userCredential.user;
      logger.debug('Signed in: $user');
      return user;
    } catch (e) {
      logger.debug('Failed to sign in: $e || $email, $password');
    }
  }

  Future<Map<String, dynamic>> getCustomClaims(User? user) async {
    if (user != null) {
      IdTokenResult idTokenResult = await user.getIdTokenResult(true);
      return idTokenResult.claims ?? {};
    }
    return {};
  }
}
