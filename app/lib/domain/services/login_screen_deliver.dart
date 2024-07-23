import 'package:app/data/adapters/firebase/auth.dart';

import 'package:app/domain/services/crud_users.dart';

import 'package:app/domain/utils/strings.dart';
import 'package:app/presentation/boilerplate/dialogs.dart';
import 'package:app/presentation/utils/navigation.dart';
import 'package:app/settings/logs.dart';

import 'package:flutter/widgets.dart';

AppLogger logger = AppLogger();

class LoginScreenDeliver {
  final String email;
  final String password;
  
  final authUser = AuthUser();

  LoginScreenDeliver(this.email, this.password);

  Future<void> deliverScreen(BuildContext context) async {

    
    AuthResponse authResponse = await authUser.byEmailPwd(email, password);

    if (context.mounted) {
        if (authResponse.error == true) {
           if (context.mounted) showErrorDialog(context, "Error", authResponse.responseStatus);
          return;
        }

    CrudUsers currentUser = CrudUsers(user: authResponse.user);

    AuthResponse customClaimResponse = await currentUser.fromCustomClaimsCurrentUserGetField("role");

    if (customClaimResponse.error == true) {
        if (context.mounted) showErrorDialog(context, "Error", customClaimResponse.responseStatus);  
        return;
    }


    if (customClaimResponse.data is! String) {
        if (context.mounted) showErrorDialog(context, "Error", customClaimResponse.responseStatus);
            return;
    }

    String rolePosition = customClaimResponse.data as String;

      if (context.mounted) mapDeliverage(context, rolePosition);

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


/**
 * Future<void> deliverScreen(BuildContext context) async {
    // there is not way if user exist do not have the attribute role
    // must be assured when create a user, role is required for all

    // try to autheticate user if not return null
    var authResponse = await userService.authUserByEmailPwd(email, password);

    if (context.mounted) {
      var handledAuthResponse =
          await userService.handleAuthResult(context, authResponse);

      var error = handledAuthResponse["error"];
      var response = handledAuthResponse["response"];

      if (error == true) {
        if (context.mounted) showErrorDialog(context, "Error", response);
      }

      var customClaim = await userService.getCustomClaims(response);

      var rolePosition = getValueFromMap(customClaim, "role");

      if (context.mounted) mapDeliverage(context, rolePosition);
    }
  }
 */