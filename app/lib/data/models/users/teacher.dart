

import 'package:app/data/models/users/abstract.dart';

class Teacher extends AbstractCustomUser {
  

  Teacher({required super.uid, required super.creatorUid, required super.email,required super.password, super.role = "teacher"});

  @override
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'creatorUid': creatorUid,
      'email': email,
      'password':password,
      'role': role,
    };
  }

  factory Teacher.fromMap(Map<String, dynamic> map) {
    return Teacher(
      uid: map["uid"], 
      creatorUid: map['creator_uid'],
      email: map['email'],
      password: map["password"],
      role: map['role'], 
    );
  }
}