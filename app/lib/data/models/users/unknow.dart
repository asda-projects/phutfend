
import 'package:app/data/models/users/abstract.dart';

class Unknow extends AbstractCustomUser {
  Unknow({required super.uid, required super.creatorUid, required super.email,required super.password, super.role = 'unknow'});

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

  factory Unknow.fromMap(Map<String, dynamic> map) {
    return Unknow(
      uid: map["uid"], 
      creatorUid: map['creator_uid'],
      email: map['email'],
      password: map["password"],
      role: map['role'], 
    );
  }
}