String? textFormIsName(String? value) {
  final nameRegExp = RegExp(r'^[a-zA-Z]+$');

  if (value == null || value.isEmpty) {
    return IfIsEmptyReturn.name;
  } else if (!nameRegExp.hasMatch(value)) {
    return IfIsEmptyReturn.name;
  }
  return null;
}

bool regexToCheckEmail(String value) {
  return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value);
}

String? textFormIsEmail(String? value) {
  if (value == null || value.isEmpty || !regexToCheckEmail(value)) {
    return IfIsEmptyReturn.email;
  }
  return null;
}

String? textFormIsPassword(String? value) {
  int minLength = 8;
  bool hasLetters = RegExp(r'[a-zA-Z]').hasMatch(value ?? '');
  bool hasDigits = RegExp(r'[0-9]').hasMatch(value ?? '');
  bool hasSpecialCharacters =
      RegExp(r'[!@#$%^&*(),._?":{}|<>]').hasMatch(value ?? '');

  if (value == null ||
      value.isEmpty ||
      value.length < minLength ||
      !hasLetters ||
      !hasDigits ||
      !hasSpecialCharacters) {
    return IfIsEmptyReturn.password;
  }
  return null;
}

String? textFormIsNotEmpty(String? value) {
  int minLength = 2;
  if (value == null || value.isEmpty || value.length < minLength) {
    return IfIsEmptyReturn.notEmpty;
  }
  return null;
}

String? textFormIsPhoneNumber(String? value) {
  if (value == null || value.isEmpty || !RegExp(r'^[0-9]+$').hasMatch(value)) {
    return IfIsEmptyReturn.phoneNumber;
  }
  return null;
}

String? textFormIsOnlyNumber(String? value) {
  if (value == null || value.isEmpty || !RegExp(r'^[0-9]+$').hasMatch(value) ) {
    return IfIsEmptyReturn.onlyNumber;
  } else {
  }
  return null;
}
  


String? textFormIsAge(String? value) {
  bool isEmpty = value == null || value.isEmpty;
  
  if (isEmpty || !RegExp(r'^[0-9]+$').hasMatch(value)) {
    return IfIsEmptyReturn.age;
  } else if (!isEmpty && RegExp(r'^[0-9]+$').hasMatch(value)) {
    bool tooOld = int.parse(value) > 150;
    if (tooOld == true) {return IfIsEmptyReturn.onlyNumber;}
    return null;
  }
  return null;
}

class IfIsEmptyReturn {
  static const String notEmpty = "Mínimo de 2 caracteres.";
  
  static const String username = "Mínimo de 2 caracteres.";
  static const String name = "Apenas letras. (abcd)";
  static const String age = "Maximum age is 150";

  static const String email = "Exemplo: user@test.com";
  static const String password =
      "Mínimo de 7 caracteres. letras. números. símbolos.";
  static const String phoneNumber =
      "Código do país + telefone. Exemplo: 012 34 567890";
  static const String onlyNumber =
      "Apenas números. (1234)";
  static const String confirmationCode =
      "6 dígitos. Somente números. Exemplo: 123456";
}
