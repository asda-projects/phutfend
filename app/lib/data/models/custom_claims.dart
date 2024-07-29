abstract class AbstractCustomClaims {

  final String name;
  final int age;
  final String gender;
  final String phoneNumber;
  final String identificationNumber;
  final String typeOfIdentificationNumber;
  final String supervisedClasses;


  static const List<String> genders = ["Man", "Woman", "Other"];
  static const List<String> identificationNumberTypes = [
    "Passport",
    "National ID Card",
    "Driver's License",
    "Social Security Card (or equivalent)",
    "Birth Certificate",
    "Voter ID Card",
    "Residence Permit",
    "Military ID Card",
    "Student ID Card",
    "Employee ID Card",
    "Health Insurance Card",
    "Immigration Documents (Visa or equivalent)",
    "Professional License (e.g., medical license, law license)",
    ];

  AbstractCustomClaims(
    {
    required this.identificationNumber, 
    required this.typeOfIdentificationNumber,
    required this.name, 
    required this.age,
    required this.gender,
    required this.phoneNumber,
    required this.supervisedClasses
    });

  Map<String, dynamic> toMap();
  factory AbstractCustomClaims.fromMap(Map<String, dynamic> map) {
    // Implementation should be in derived classes
    throw UnimplementedError('This method should be implemented in derived classes');
  }
}



class StaffCustomClaims extends AbstractCustomClaims {

  


  
StaffCustomClaims(
   
  {
  required super.identificationNumber,
  required super.typeOfIdentificationNumber,
  required super.name,
  required super.age, 
  required super.gender,
  required super.phoneNumber, required super.supervisedClasses
  });

  // Providing concrete implementation of fromMap
  factory StaffCustomClaims.fromMap(Map<String, dynamic> map) {
    return StaffCustomClaims(
     identificationNumber:  map['identificationNumber'],
    typeOfIdentificationNumber: map['typeOfIdentificationNumber'],
      name: map['name'],
      age: map['age'],
      gender: map['gender'],
      phoneNumber: map['phoneNumber'], 
      supervisedClasses: 'supervisedClasses',
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'identificationNumber': identificationNumber,
    'typeOfIdentificationNumber' : typeOfIdentificationNumber,
      'name': name,
      'age': age,
      'gender': gender,
      'phoneNumber': phoneNumber, 
      'supervisedClasses': supervisedClasses,
    };
  }
}