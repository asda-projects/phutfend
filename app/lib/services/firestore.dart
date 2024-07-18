import 'package:app/utils/logs.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  AppLogger logger = AppLogger();

  authUserByEmailPwd(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      logger.debug('Signed in: ${userCredential.user?.email}');
    } catch (e) {
      logger.debug('Failed to sign in: $e');
    }
  }
}
