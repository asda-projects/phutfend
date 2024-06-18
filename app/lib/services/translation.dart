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



class TranslatableText extends StatefulWidget {
  final String text;
  final TextStyle style;

  const TranslatableText(this.text, this.style, {super.key});

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
    final newText = await translationService.translateText(widget.text, languageCode);
    setState(() {
      translatedText = newText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      translatedText.isEmpty ? widget.text : translatedText,
      style: widget.style,
    );
  }
}




class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        hoverColor: Colors.transparent,
        focusColor:  Colors.transparent,

      ),
      child: DropdownButton<String>(
          dropdownColor: Color.fromRGBO(0, 0, 0, 0.886),
           
          underline: Container(), // Remove underline
          borderRadius: BorderRadius.circular(10.0), // Adiciona bordas arredondadas
          
          icon: const Padding(
            padding: EdgeInsets.only(right: 55, left: 0),
            child: Icon(Icons.translate, color: Colors.black),
          ),
          
          items: [
            DropdownMenuItem<String>(
              value: 'en',
              child: Text('English', style: const TextStyle(color: Colors.white54)),
            ),
            DropdownMenuItem<String>(
              value: 'th',
              child: Text('ไทย', style: const TextStyle(color: Colors.white54)),
            ),
            DropdownMenuItem<String>(
              value: 'pt',
              child: Text('Português', style: const TextStyle(color: Colors.white54)),
            ),
            DropdownMenuItem<String>(
              value: 'zh-cn',
              child: Text('中文', style: const TextStyle(color: Colors.white54)),
            ),
          ],
          onChanged: (String? newValue) {
            if (newValue != null) {
              Provider.of<LanguageProvider>(context, listen: false).changeLanguage(newValue);
            }
          },
        
      
    ));
  }
}




