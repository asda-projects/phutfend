


import 'package:app/presentation/boilerplate/buttons.dart';
import 'package:app/presentation/boilerplate/text_fields.dart';
import 'package:app/presentation/utils/app_bar.dart';
import 'package:flutter/material.dart';

class StaffAddClassScreen extends StatelessWidget {
  const StaffAddClassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: OverflowAppBar(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          additionalWidth: 245,
          incrementWidth: 120,
          actions: [
          
          SearchBox(
            boxHeight: 40,
            boxWidth: 300,
            boxPadding:  const EdgeInsets.only(left:90),
            boxBorderRadius: BorderRadius.circular(16.0),
            boxTextHint: "Search a class...",
            ),
                
              
          
          const Padding(
              padding: EdgeInsets.only(right: 20), child: LanguageSelector())
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        ),
      body: const SizedBox()
 ));
  }
}