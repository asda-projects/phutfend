

import 'package:app/data/adapters/firebase/auth.dart';
import 'package:app/data/models/custom_claims.dart';
import 'package:app/data/models/users.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class CrudUsers {
 

  // it will come from AuthUser.byEmailPwd 
  // so or will return User instance or null
  // it need to come as userCredential.user
  final String collectionName = 'users';
  //
  final User? currentUser;
  final AuthUser _authUser = AuthUser();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  

  CrudUsers({User? user}) : currentUser = user ?? AuthUser().fireauth.currentUser;




  Future<List<Map<String, dynamic>>> getAll() async {
     bool ableTo= await isStaffRole(currentUser);
     if (ableTo == true) {
    QuerySnapshot querySnapshot = await _firestore.collection(collectionName).get();
    return querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  }
    return [{}];
  }
  Future<User?> create(String email, String password, String role, AbstractCustomClaims customClaims) async {

    //verify is its staff to be able to create other users
    bool ableToCreate = await isStaffRole(currentUser);

    if (ableToCreate == true) {
      
      //start the process of creating user
      try {

        AbstractCustomUser newUser = AppUser(creatorUid: currentUser!.uid,  uid: '', password: password, email: email, role: role);

        if (newUser.roles.contains(role) == true) {



          UserCredential userCredential = await _authUser.fireauth.createUserWithEmailAndPassword(email: email, password: password);
          User? user = userCredential.user;

          if( user != null) {
          
                newUser.uid = user.uid;
               
                Map newUserWithCustomClaimsMapped = {...customClaims.toMap(), ...newUser.toMap()};
                // after created the user for auth
                // is added in the collection [collectionName] the extras fields
                await _firestore.collection(collectionName).doc(user.uid).set(newUserWithCustomClaimsMapped.cast<String, String>());
                return user;
        }

          return null;
        
        }

        // if the role user is unkown so its return this
        return null;


      }
      catch (e) {


      // if during the process occurs some error return this
      return null;
      }
    }
    // and if the user is not able to create return this
    return null;

  }

  Future<AuthResponse> fromCustomClaimsCurrentUserGetField(String keyField) async {

    Map<String, dynamic> customClaims = await getCustomClaimsFromCurrentUser();

    String? role = customClaims["role"];

    if (role == null) {
      return AuthResponse(user: currentUser, error: true, responseStatus: AuthResponseMessages.responseStatus["missing-credentials-bussiness-logic"]!);
    }

    return AuthResponse(data: role,  user: currentUser, error: false, responseStatus: AuthResponseMessages.responseStatus["successful-auth"]!);



  }

  Future<Map<String, dynamic>> getCustomClaimsFromCurrentUser() async {

      /**
     * custom claim will be a extra info about user,
     * as user firebase cannot be modified it will be added as extra field
     * 
     */
  if (currentUser == null) {
    return {};
  }

  DocumentSnapshot<Map<String, dynamic>> snapshot = await _firestore.collection(collectionName).doc(currentUser!.uid).get();
  return snapshot.data() ?? {};
  }


  Future<Map<String, dynamic>>  getCustomClaimsFromUser(User? user) async {

      /**
     * custom claim will be a extra info about user,
     * as user firebase cannot be modified it will be added as extra field
     * 
     */
  if (user == null) {
    return {};
  }

  DocumentSnapshot<Map<String, dynamic>> snapshot = await _firestore.collection(collectionName).doc(user.uid).get();
  return snapshot.data() ?? {};
  }

  Future<bool> isStaffRole(User? currentUser) async {
    if (currentUser == null) {
      return false;
    }

    var claims = await getCustomClaimsFromUser(currentUser);
    return claims['role'] == 'staff';

  }

Future<bool> isSelfUser(User currentUser) async {
  
  User? user = _authUser.fireauth.currentUser;

  return user != null && user.uid == currentUser.uid;
}



}