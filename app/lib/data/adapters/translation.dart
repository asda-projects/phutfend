import 'package:app/settings/logs.dart';
import 'package:flutter/material.dart';
import 'package:translator/translator.dart';
import 'package:provider/provider.dart';

AppLogger logger = AppLogger();

class LanguageProvider with ChangeNotifier {
  String _languageCode = 'en';

  String get languageCode => _languageCode;

  void changeLanguage(String newLanguageCode) {
    _languageCode = newLanguageCode;
    notifyListeners();
  }
}

class TranslationService {
  
  final GoogleTranslator _translator = GoogleTranslator();

  Future<String> translateText(String text, String targetLanguage) async {
    var translation = await _translator.translate(text, to: targetLanguage);
    return translation.text;
  }

  static Future<String> getTranslatedString( String text, BuildContext context) async {
    final languageCode = Provider.of<LanguageProvider>(context, listen: false).languageCode;
    final translationService = TranslationService();
    return await translationService.translateText(text, languageCode);
  }
}



Future<String> getCachedTranslation(BuildContext context,String text, Map translationsCache) async {
    final languageCode = Provider.of<LanguageProvider>(context, listen: false).languageCode;
    final cacheKey = '$text-$languageCode';
    if (translationsCache.containsKey(cacheKey)) {
       logger.debug('Cache hit for translation: $cacheKey');
      return translationsCache[cacheKey]!;
    } else {
      logger.debug('Cache miss for translation: $cacheKey');
      String translation = await TranslationService().translateText(text, languageCode);
      translationsCache[cacheKey] = translation;
      return translation;
    }
  }


