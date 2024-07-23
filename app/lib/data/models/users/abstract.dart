abstract class AbstractCustomUser {
  String uid;
  String creatorUid;
  String email;
  String password;
  String role;

  AbstractCustomUser({required this.uid, required this.creatorUid, required this.email, required this.password, required this.role});

  Map<String, dynamic> toMap();
  factory AbstractCustomUser.fromMap(Map<String, dynamic> map) {
    // Implementation should be in derived classes
    throw UnimplementedError('This method should be implemented in derived classes');
  }
}

