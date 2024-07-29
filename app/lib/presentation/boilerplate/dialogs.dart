// ignore_for_file: use_build_context_synchronously

import 'package:app/data/adapters/translation.dart';

import 'package:flutter/material.dart';



void genericFormDialog(BuildContext context, Widget contentBody, {bool barrierDismissible = true}) {
  showDialog(
    
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (BuildContext context) {
      return AlertDialog(
        shadowColor: Theme.of(context).colorScheme.onTertiary,
        backgroundColor: Theme.of(context).colorScheme.inverseSurface,
        content: contentBody
        );
});
}


void showErrorDialog(BuildContext context, String title, String message) async {


  TextStyle defaultContentTextStyle = TextStyle(
    fontSize: 12,
    color: Theme.of(context).scaffoldBackgroundColor,
    fontWeight: FontWeight.bold
  );

  // Cache for translations
  Map<String, String> translationsCache = {};

  

  
  String translatedContent = await getCachedTranslation(context,message, translationsCache);
  String translatedButtonText = await getCachedTranslation(context,'OK', translationsCache);

  showDialog(
    
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        icon: const Icon(Icons.error_outline_rounded),
        shadowColor: Theme.of(context).colorScheme.inverseSurface.withOpacity(0.6),
        backgroundColor: Theme.of(context).colorScheme.inverseSurface,
        content: Text(
          translatedContent,
          style: defaultContentTextStyle,
          softWrap: true,
          overflow: TextOverflow.clip,
        ),
        actions: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).colorScheme.secondary
            ),
            child:TextButton(
            
            child: Text(
              translatedButtonText,
              style: defaultContentTextStyle,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )),
        ],
      );
    },
  );
}
