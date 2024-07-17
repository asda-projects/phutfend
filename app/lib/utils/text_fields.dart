import 'package:app/services/translation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

regexToCheckEmail(value) {
  return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value);
}

textFormIsEmail(value, ifIsEmptyReturn) {
  var isEmailFormat = regexToCheckEmail(value);

  if (value == null ||
      value.isEmpty ||
      !value.contains('@') ||
      !isEmailFormat) {
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

  if (value == null ||
      value.isEmpty ||
      value.length < lengthOfText ||
      !hasLetters ||
      !hasDigits ||
      !hasSpecialCharacters) {
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

class IfIsEmptyReturn {
  static const String username =
      "2+ characters. Letters, numbers...\nunderscore and etc.";
  static const String email =
      "eg: username@example.com...\nminimum after dot is 2 characters. eg: .co";
  static const String password =
      "7+ char, letters, num, & symb...\nPassword shown encrypted in app.";
  static const String phoneNumber =
      "Add country code, province/state...\n and number. eg: 01234567890";
  static const String name = "2+ characters...\n Only letters.";
  static const String confirmationCode =
      "6 digits...\nOnly numbers. eg: 123456";

  static Future<String> getTranslatedString(
      String text, BuildContext context) async {
    final languageCode =
        Provider.of<LanguageProvider>(context, listen: false).languageCode;
    final translationService = TranslationService();

    return await translationService.translateText(text, languageCode);
  }
}

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final String ifIsEmptyReturn;
  final Function(String) onChanged;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final dynamic validator;
  final int? maxLength;
  final int? maxLines;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;

  const CustomTextFormField({
    super.key,
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
    this.maxLines = 1,
  });

  Future<String> _getTranslatedHint(BuildContext context) async {
    return await IfIsEmptyReturn.getTranslatedString(ifIsEmptyReturn, context);
  }

  Future<String> _getTranslatedLabel(BuildContext context) async {
    return await IfIsEmptyReturn.getTranslatedString(labelText, context);
  }

  validate(validator_, value) {
    validator_ ??= textFormIsNotEmpty;
    return validator_(value, ifIsEmptyReturn);
  }

  _labelStyle() {
    return labelStyle ??
        const TextStyle(
          fontSize: 16,
        );
  }

  _hintStyle() {
    return hintStyle ??
        const TextStyle(
          fontSize: 14,
        );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: Future.wait([
        _getTranslatedLabel(context),
        _getTranslatedHint(context),
      ]),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container();
        }

        final translatedLabel = snapshot.data![0];
        final translatedHint = snapshot.data![1];

        return TextFormField(
          maxLines: maxLines,
          enableSuggestions: false,
          maxLength: maxLength,
          autofillHints: [],
          controller: controller,
          decoration: InputDecoration(
            labelText: translatedLabel,
            hintText: translatedHint,
            labelStyle: _labelStyle(),
            hintStyle: _hintStyle(),
          ),
          keyboardType: keyboardType,
          obscureText: obscureText,
          validator: (value) => validate(validator, value),
          onChanged: onChanged,
        );
      },
    );
  }
}

class TranslatableText extends StatefulWidget {
  final String text;
  final TextStyle style;
  final dynamic softWrap;
  final dynamic overflow;

  const TranslatableText(this.text, this.style,
      {super.key, this.softWrap, this.overflow});

  @override
  // ignore: library_private_types_in_public_api
  _TranslatableTextState createState() => _TranslatableTextState();
}

class _TranslatableTextState extends State<TranslatableText> {
  String translatedText = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _translateText();
  }

  Future<void> _translateText() async {
    final languageCode = Provider.of<LanguageProvider>(context).languageCode;
    final translationService = TranslationService();
    final newText =
        await translationService.translateText(widget.text, languageCode);
    setState(() {
      translatedText = newText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      translatedText.isEmpty ? widget.text : translatedText,
      style: widget.style,
      softWrap: widget.softWrap,
      overflow: widget.overflow,
    );
  }
}
