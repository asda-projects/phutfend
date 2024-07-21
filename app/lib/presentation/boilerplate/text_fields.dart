import 'package:app/data/adapters/translation.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final ifIsEmptyReturn;
  final Function(String) onChanged;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
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

  Future<List<String>> _getTranslatedTexts(BuildContext context) async {
    return Future.wait([
      TranslationService.getTranslatedString(labelText, context),
      TranslationService.getTranslatedString(ifIsEmptyReturn, context),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: _getTranslatedTexts(context),
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
            labelStyle: labelStyle ?? const TextStyle(fontSize: 16),
            hintStyle: hintStyle ?? const TextStyle(fontSize: 14),
          ),
          keyboardType: keyboardType,
          obscureText: obscureText,
          validator: validator,
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
    if (!mounted) return; // Check if the widget is still mounted
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
