

import 'package:app/data/adapters/firebase/auth.dart';
import 'package:app/data/models/users/abstract.dart';
import 'package:app/data/models/users/staff.dart';
import 'package:app/data/models/users/student.dart';
import 'package:app/data/models/users/teacher.dart';
import 'package:app/data/models/users/unknow.dart';
import 'package:app/domain/utils/maps.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CrudUsers {
 

  // it will come from AuthUser.byEmailPwd 
  // so or will return User instance or null
  // it need to come as userCredential.user
  final String collectionName = 'users_custom_claims';
  //l4kKS28eiK4VjG5jhKK2cOtYOLvD
  final User? currentUser;
  final AuthUser _authUser = AuthUser();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;



  CrudUsers({required this.currentUser});

  Future<User?> create(String email, String password, String role, Map<String, dynamic>? customClaims) async {

    //verify is its staff to be able to create other users
    bool ableToCreate = await isStaffRole(currentUser);

    if (ableToCreate == true) {
      
      //start the process of creating user
      try {

        AbstractCustomUser newUser;
        // check which type of user is to be created
        // made a classe with case for field treatment if needed in the future
        switch (role) {
          case 'student':
            newUser = Student(creatorUid: currentUser!.uid,  uid: '', password: '', email: '');
            break;
          case 'teacher':
            newUser = Teacher(creatorUid: currentUser!.uid,  uid: '', password: '', email: '');
            break;
          case 'staff':
            newUser = Staff(creatorUid: currentUser!.uid,  uid: '', password: '', email: '');
            break;
          default:
            newUser = Unknow(creatorUid: currentUser!.uid,  uid: '', password: '', email: '');
            break;
        }

        // if the role is not correct so its not created
        if (newUser.role != "unknow") {

          // here is created after the user after the 2 main verification
          // if who is creating is the user is staff
          // and if the role for the creation is not a unknow role

          UserCredential userCredential = await _authUser.fireauth.createUserWithEmailAndPassword(email: email, password: password);
          var user = userCredential.user;
          
          // remove some fields to not be duplicated bcuz in user firebase already exist
          Map newUserMapped = removeFromMap(newUser.toMap(), ["email", "uid", "password"]);


          //if there is any extra field that is need to add it added here
          if (customClaims != null) {
            newUserMapped.addAll(customClaims.map((key, value) => MapEntry(key, value.toString())));
          }

          // after created the user for auth
          // is added in the collection users_custom_claims the extras fields
          await _firestore.collection(collectionName).doc(user!.uid).set(newUserMapped.cast<String, String>());
          return user;
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