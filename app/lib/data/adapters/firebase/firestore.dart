import 'package:app/data/adapters/firebase/errors_handling.dart';

import 'package:app/settings/logs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

AppLogger logger = AppLogger();

class UserFireBaseService {
  Future<Map> authUserByEmailPwd(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      var user = userCredential.user;
      logger.debug('Signed in...');
      return {'user': user};
    } on FirebaseAuthException catch (e) {
      logger.debug('Failed to sign in: ${e.code} || $email, $password');
      return {'errorCode': e.code};
    } catch (e) {
      logger.debug('Failed to sign in: $e || $email, $password');
      return {'errorCode': 'unknown'};
    }
  }

  getCustomClaims(User? user) async {
    if (user != null) {
      IdTokenResult idTokenResult = await user.getIdTokenResult(true);
      return idTokenResult.claims ?? {};
    }
    return {};
  }

  handleAuthResult(
      BuildContext context, Map resultFromAuthUserByEmailPwd) async {
    if (resultFromAuthUserByEmailPwd.containsKey('errorCode')) {
      logger.debug("Auth Result $resultFromAuthUserByEmailPwd");
      return {
        "error": true,
        "response": AuthErrorHandling.getErrorMessage(
            resultFromAuthUserByEmailPwd['errorCode'])
      };
    } else if (resultFromAuthUserByEmailPwd.containsKey('user')) {
      // User is authenticated, get custom claims
      return {"error": false, "response": resultFromAuthUserByEmailPwd["user"]};
    }
  }
}
