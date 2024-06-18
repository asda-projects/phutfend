import 'package:flutter/material.dart';

regexToCheckEmail(value) {
  return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value);
}

textFormIsEmail(value, ifIsEmptyReturn) {

  var isEmailFormat = regexToCheckEmail(value);

  if (value == null || value.isEmpty || !value.contains('@') || !isEmailFormat) {
    return ifIsEmptyReturn;
  }
  return null;
}

//8+ characters, mix letters, numbers, and symbols!

textFormIsPassword(value, ifIsEmptyReturn) {

  int lengthOfText = 7;
  var hasLetters = RegExp(r'[a-zA-Z]').hasMatch(value);
  var hasDigits = RegExp(r'[0-9]').hasMatch(value);
  var hasSpecialCharacters = RegExp(r'[!@#$%^&*(),._?":{}|<>]').hasMatch(value);

  if (value == null || value.isEmpty || value.length < lengthOfText || !hasLetters || !hasDigits || !hasSpecialCharacters) {
    return ifIsEmptyReturn;
  }
  return null;
}

textFormIsNotEmpty(value, String ifIsEmptyReturn) {

  int lengthOfText = 2;
  
  if (value == null || value.isEmpty || value.length < lengthOfText) {
          return ifIsEmptyReturn;
        }
  return null;


}

textFormIsOnlyNumbers(value, String ifIsEmptyReturn) {

  if (value == null || value.isEmpty || !RegExp(r'^[0-9]+$').hasMatch(value)) {
          return ifIsEmptyReturn;
        }
  return null;
}


class ifIsEmptyReturn {
  static String username = "2+ characters. Letters, numbers...\nunderscore and etc.";
  static String email = "eg: username@example.com...\nminimum after dot is 2 characters. eg: .co";
  static String password = "7+ char, letters, num, & symb...\nPassword shown encrypted in app.";
  static String phoneNumber = "Add country code, province/state...\n and number. eg: 01234567890";
  static String name = "2+ characters...\n Only letters.";
  static String confirmationCode = "6 digits...\nOnly numbers. eg: 123456";
}



class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final String ifIsEmptyReturn;
  final  onChanged;
  final TextEditingController controller;
  final bool obscureText;
  final keyboardType;
  final dynamic validator;
  final int? maxLength;
  final int? maxLines;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;


  const CustomTextFormField(
      {super.key,
      required this.labelText,
      required this.ifIsEmptyReturn,
      required this.onChanged,
      required this.controller,
      this.labelStyle,
      this.hintStyle,
      this.obscureText = false,
      this.keyboardType = TextInputType.text,
      this.validator,
      this.maxLength, 
      this.maxLines = 1
      });

  
  validate(validator_, value)  {
    
    validator_ ??= textFormIsNotEmpty;

    return validator_(value, ifIsEmptyReturn);
  }

  _labelStyle() {
    return labelStyle ?? const TextStyle(
      fontSize: 16, 
    );
  }

  _hintStyle() {
    return hintStyle ?? const TextStyle(
      fontSize: 14, 
    );
  }


  @override
  Widget build(BuildContext context) { 



    return TextFormField(
      maxLines: maxLines,
      enableSuggestions: false,
      maxLength: maxLength,
      autofillHints: [],
      controller: controller,
      
      decoration: InputDecoration(labelText: labelText, hintText: ifIsEmptyReturn, 
      labelStyle: _labelStyle(),
    hintStyle: _hintStyle()),
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: (value) => validate(validator, value),
      onChanged: onChanged,
    );
  }
}

