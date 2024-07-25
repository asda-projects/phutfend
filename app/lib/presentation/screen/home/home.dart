// ignore: use_key_in_widget_constructors


import 'package:app/presentation/boilerplate/buttons.dart';
import 'package:app/presentation/screen/home/on_boarding.dart';



import 'package:app/presentation/utils/app_bar.dart';

import 'package:app/settings/logs.dart';



import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  AppLogger logger = AppLogger();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Color backgroundC = Color.fromARGB(255, 29, 29, 29);

    return const Scaffold(
      appBar:  OverflowAppBar(
        incrementWidth: 130,
        actions: [
        Expanded(child: SizedBox()),
        Padding(padding: EdgeInsets.only(right: 20), child: LanguageSelector())
      ]),
      body: OnBoardingScreen(),
    );
  }
}
