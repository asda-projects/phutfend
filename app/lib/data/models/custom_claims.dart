abstract class AbstractCustomClaims {

  final String name;
  final int age;
  final String gender;
  final String phoneNumber;
  final String identificationNumber;


  List genders = ["woman", "female", "other"];

  AbstractCustomClaims(
    this.identificationNumber, {
    required this.name, 
    required this.age,
    required this.gender,
    required this.phoneNumber
    });

  Map<String, dynamic> toMap();
  factory AbstractCustomClaims.fromMap(Map<String, dynamic> map) {
    // Implementation should be in derived classes
    throw UnimplementedError('This method should be implemented in derived classes');
  }
}



class StaffCustomClaims extends AbstractCustomClaims {

  


  
StaffCustomClaims(super.identificationNumber, {required super.name,required super.age, required super.gender,required super.phoneNumber});

  // Providing concrete implementation of fromMap
  factory StaffCustomClaims.fromMap(Map<String, dynamic> map) {
    return StaffCustomClaims(
      map['identificationNumber'],
      name: map['name'],
      age: map['age'],
      gender: map['gender'],
      phoneNumber: map['number'],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'identificationNumber': identificationNumber,
      'name': name,
      'age': age,
      'gender': gender,
      'number': phoneNumber,
    };
  }
}