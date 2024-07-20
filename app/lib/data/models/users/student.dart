import 'package:app/data/models/users/abstract.dart';

class Student extends AbstractCustomUser {
  


  Student({required super.uid,required super.creatorUid, required super.email,required super.password, super.role =  "student"});

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

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      uid: map["uid"], 
      creatorUid: map['creator_uid'],
      email: map['email'],
      password: map["password"],
      role: map['role'], 
    );
  }
}
