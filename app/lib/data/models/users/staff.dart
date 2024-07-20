import 'package:app/data/models/users/abstract.dart';

class Staff extends AbstractCustomUser {
  

  Staff({required super.uid, required super.password, required super.creatorUid, required super.email,super.role  = "staff"});

  @override
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'creator_uid': creatorUid,
      'email': email,
      'password':password,
      'role': role,
    };
  }

  factory Staff.fromMap(Map<String, dynamic> map) {
    return Staff(
      uid: map["uid"],
      creatorUid: map['creator_uid'],
      email: map['email'],
      password: map['password'],
      role: map['role']
    );
  }
}