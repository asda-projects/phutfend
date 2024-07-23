import 'package:app/data/adapters/translation.dart';


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  // ignore: prefer_typing_uninitialized_variables
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
    translateText();
  }

  Future<void> translateText() async {
    final languageCode = Provider.of<LanguageProvider>(context).languageCode;
    final translationService = TranslationService();
    final newText =
        await translationService.translateText(widget.text, languageCode);
    // Check if the widget is still mounted
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

class SearchBox extends StatefulWidget {
  final double boxHeight;
  final double boxWidth;
  final BorderRadius boxBorderRadius;
  final EdgeInsetsGeometry boxPadding;
  final String boxTextHint;

  SearchBox({
    super.key,
    required this.boxHeight,
    required this.boxWidth,
    required this.boxBorderRadius,
    required this.boxPadding,
    this.boxTextHint = 'Search',
  });

  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  String hintText = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _translateHintText();
  }

  Future<void> _translateHintText() async {
    final languageCode = Provider.of<LanguageProvider>(context).languageCode;
    final translationService = TranslationService();
    final newText = await translationService.translateText(widget.boxTextHint, languageCode);
    if (mounted) {
      setState(() {
        hintText = newText;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.boxHeight,
      width: widget.boxWidth,
      padding: widget.boxPadding,
      child: TextField(
        decoration: InputDecoration(
          hintStyle: const TextStyle(fontSize: 13),
          contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
          hintText: hintText.isEmpty ? widget.boxTextHint : hintText,
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: widget.boxBorderRadius,
          ),
        ),
      ),
    );
  }
}