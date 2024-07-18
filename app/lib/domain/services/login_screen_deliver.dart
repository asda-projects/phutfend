import 'package:app/data/adapters/firebase/errors_handling.dart';
import 'package:app/data/adapters/firebase/firestore.dart';
import 'package:app/domain/utils/maps.dart';
import 'package:app/domain/utils/strings.dart';
import 'package:app/presentation/boilerplate/dialogs.dart';
import 'package:app/presentation/utils/navigation.dart';
import 'package:app/settings/logs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

AppLogger logger = AppLogger();

class LoginScreenDeliver {
  final String email;
  final String password;
  final userService = UserFireBaseService();

  LoginScreenDeliver(this.email, this.password);

  Future<void> deliverScreen(BuildContext context) async {
    // there is not way if user exist do not have the attribute role
    // must be assured when create a user, role is required for all
    try {
      // try to autheticate user if not return null
      var user = await userService.authUserByEmailPwd(email, password);

      // if is null then return empty map {}, otherwise return the user data
      var userCustomClaims = await userService.getCustomClaims(user);

      // get a specific value from a map based on the key if its exists there
      var rolePosition = getValue(userCustomClaims, "role");
      if (context.mounted) {
        // before to push to another page from async func check if is mounted

        mapDeliverage(context, rolePosition);
      }
    } on FirebaseAuthException catch (e) {
      logger.debug('FirebaseAuthException: ${e.message}');
      String errorMessage = AuthErrorHandling.getErrorMessage(e.code);
      if (context.mounted) {
        showErrorDialog(context, 'Authentication Error', errorMessage);
      }
    } catch (e) {
      logger.debug('Unexpected Error: $e');
      if (context.mounted) {
        showErrorDialog(context, 'Error',
            'An unexpected error occurred. Please try again later.');
      }
    }
  }

  void mapDeliverage(BuildContext context, String rolePosition) {
    /**
   * case 1 = staff return navigateToPage(context, StaffMain)
   * case 2 = student return navigateToPage(context, StudentMain)
   * case 3 = teacher return navigateToPage(context, TeacherMain)
   */

    var position = lowerCaseString(rolePosition);

    switch (position) {
      case 'staff':
        navigateToPage(context, "StaffMain");
        break;

      case 'student':
        navigateToPage(context, "StudentMain");
        break;

      case 'teacher':
        navigateToPage(context, "TeacherMain");
        break;

      default:
        logger.debug('Invalid role position: $position');
    }
  }
}
