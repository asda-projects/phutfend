

abstract class AbstractCustomUser {
  String uid;
  String creatorUid;
  String email;
  String password;
  String role;

  List roles = ["staff", "teacher", "student"];

  AbstractCustomUser({required this.uid, required this.creatorUid, required this.email, required this.password, required this.role});

  Map<String, dynamic> toMap();
  factory AbstractCustomUser.fromMap(Map<String, dynamic> map) {
    // Implementation should be in derived classes
    throw UnimplementedError('This method should be implemented in derived classes');
  }
}

class AppUser extends AbstractCustomUser {
  


  AppUser({required super.uid,required super.creatorUid, required super.email,required super.password, required super.role});

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

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      uid: map["uid"], 
      creatorUid: map['creator_uid'],
      email: map['email'],
      password: map["password"],
      role: map['role'], 
    );
  }
  

}