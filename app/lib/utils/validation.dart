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
    return IfIsEmptyReturn.name;
  }
  return null;
}

String? textFormIsOnlyNumbers(String? value) {
  if (value == null || value.isEmpty || !RegExp(r'^[0-9]+$').hasMatch(value)) {
    return IfIsEmptyReturn.phoneNumber;
  }
  return null;
}

class IfIsEmptyReturn {
  static const String username = "Mínimo de 2 caracteres.";
  static const String email = "Exemplo: user@test.com";
  static const String password =
      "Mínimo de 7 caracteres. letras. números. símbolos.";
  static const String phoneNumber =
      "Código do país + telefone. Exemplo: 012 34 567890";
  static const String name = "Mínimo de 2 caracteres.";
  static const String confirmationCode =
      "6 dígitos. Somente números. Exemplo: 123456";
}
