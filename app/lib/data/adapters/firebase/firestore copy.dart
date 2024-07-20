import 'package:app/data/adapters/firebase/errors_handling.dart';


import 'package:app/settings/logs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_admin/firebase_admin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

AppLogger logger = AppLogger();

class UserFireBaseService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAdmin _admin = FirebaseAdmin.instance;
  





  Future<Map> createUserByEmailPwd(String email, String password, String role, User currentUser, {Map<String, dynamic>? additionalClaims}) async {
    // Validate if the current user has staff role
    var validationResult = await validateStaffRole(currentUser);
    if (validationResult['error']) {
      return validationResult;
    }

    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      var user = userCredential.user;

      // Create a CustomUser object
      CustomUser newUser;
      if (role == 'student') {
        newUser = Student(uid: user!.uid, email: email);
      } else if (role == 'teacher') {
        newUser = Teacher(uid: user!.uid, email: email);
      } else if (role == 'staff') {
        newUser = Staff(uid: user!.uid, email: email);
      } else {
        return {'errorCode': 'invalid-role'};
      }

      // Add the user's role to Firestore
      await _firestore.collection('users').doc(user.uid).set(newUser.toMap());

      // Add custom claims
      var customClaims = {'role': role};
  if (additionalClaims != null) {
    customClaims.addAll(additionalClaims.map((key, value) => MapEntry(key, value.toString())));
  }
  await _admin.auth().setCustomUserClaims(user.uid, customClaims.cast<String, String>());


      logger.debug('User created and role assigned.');
      return {'response': newUser};
    } on FirebaseAuthException catch (e) {
      logger.debug('Failed to create user: ${e.code} || $email');
      return {'errorCode': e.code};
    } catch (e) {
      logger.debug('Failed to create user: $e || $email');
      return {'errorCode': 'unknown'};
    }
  }

  Future<Map> updateUserClaims(String uid, Map<String, dynamic> updatedClaims, User currentUser) async {
    // Validate if the current user has staff role
    var validationResult = await validateStaffRole(currentUser);
    if (validationResult['error']) {
      return validationResult;
    }

    try {
      await FirebaseAdmin.instance.auth().setCustomUserClaims(uid, updatedClaims);
      return {'response': 'Claims updated successfully'};
    } catch (e) {
      logger.debug('Failed to update claims: $e');
      return {'errorCode': 'claim-update-failed'};
    }
  }

  Future<Map> updateUserPassword(String uid, String newPassword, User currentUser) async {
    // Validate if the current user has staff role
    var validationResult = await validateStaffRole(currentUser);
    if (validationResult['error']) {
      return validationResult;
    }

    try {
      var user = await _auth.getUser(uid);
      await user.updatePassword(newPassword);
      return {'response': 'Password updated successfully'};
    } catch (e) {
      logger.debug('Failed to update password: $e');
      return {'errorCode': 'password-update-failed'};
    }
  }

  Future<Map> updateUserEmail(String uid, String newEmail, User currentUser) async {
    // Validate if the current user has staff role
    var validationResult = await validateStaffRole(currentUser);
    if (validationResult['error']) {
      return validationResult;
    }

    try {
      var user = await _auth.getUser(uid);
      await user.updateEmail(newEmail);
      await _firestore.collection('users').doc(uid).update({'email': newEmail});
      return {'response': 'Email updated successfully'};
    } catch (e) {
      logger.debug('Failed to update email: $e');
      return {'errorCode': 'email-update-failed'};
    }
  }



  Future<Map> validateStaffRole(User currentUser) async {
    var claims = await getCustomClaims(currentUser);
    if (claims['role'] != 'staff') {
      return {'error': true, 'errorCode': 'permission-denied'};
    }
    return {'error': false};
  }
}
