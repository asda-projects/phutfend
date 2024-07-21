// ignore_for_file: use_build_context_synchronously

import 'package:app/data/adapters/translation.dart';

import 'package:flutter/material.dart';



void showErrorDialog(BuildContext context, String title, String message) async {
  TextStyle defaultTitleTextStyle = TextStyle(
    fontSize: 14,
    color: Theme.of(context).colorScheme.primary,
  );

  TextStyle defaultContentTextStyle = TextStyle(
    fontSize: 12,
    color: Theme.of(context).colorScheme.primary,
  );

  // Cache for translations
  Map<String, String> translationsCache = {};

  

  String translatedTitle = await getCachedTranslation(context, title, translationsCache);
  String translatedContent = await getCachedTranslation(context,message, translationsCache);
  String translatedButtonText = await getCachedTranslation(context,'OK', translationsCache);

  showDialog(
    
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          translatedTitle,
          style: defaultTitleTextStyle,
        ),
        content: Text(
          translatedContent,
          style: defaultContentTextStyle,
          softWrap: true,
          overflow: TextOverflow.clip,
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              translatedButtonText,
              style: defaultContentTextStyle,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
