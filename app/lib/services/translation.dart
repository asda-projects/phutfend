import 'package:flutter/material.dart';
import 'package:translator/translator.dart';
import 'package:provider/provider.dart'; 

class TranslationService {
  final GoogleTranslator _translator = GoogleTranslator();

  Future<String> translateText(String text, String targetLanguage) async {
    var translation = await _translator.translate(text, to: targetLanguage);
    return translation.text;
  }
}


class LanguageProvider with ChangeNotifier {
  String _languageCode = 'en';

  String get languageCode => _languageCode;

  void changeLanguage(String newLanguageCode) {
    _languageCode = newLanguageCode;
    notifyListeners();
  }
}



