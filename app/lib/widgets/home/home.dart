// ignore: use_key_in_widget_constructors

import 'package:app/boilerplate/assets.dart';
import 'package:app/boilerplate/buttons.dart';
import 'package:app/utils/logs.dart';
import 'package:app/utils/navigation.dart';
import 'package:app/boilerplate/text_fields.dart';

import 'package:app/widgets/home/preview_top5_stats.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  AppLogger logger = AppLogger();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Color backgroundC = Color.fromARGB(255, 29, 29, 29);
    double sizeHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(actions: const [
        Padding(
            padding: const EdgeInsets.only(right: 20),
            child: LanguageSelector())
      ]),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topCenter,
          height: sizeHeight <= 400
              ? sizeHeight * 4
              : sizeHeight <= 600
                  ? sizeHeight * 1.5
                  : sizeHeight,
          //media query
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.surface,
              Theme.of(context).colorScheme.surface
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),

          child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Container(
                    width: 300,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 1), // Adjust the width as needed

                    child: const CustomImage(
                      assetName: "ala-logo.png",
                      width: 80,
                      height: 120,
                    )),
                const SizedBox(height: 4),
                Top5Players(),
                const SizedBox(
                  height: 30,
                ),
                CustomIconAndTextButton(
                  icon: Icons.arrow_forward_ios_sharp,
                  onPressed: () {
                    navigateToPage(context, "Login");
                  },
                  text: "Login",
                  padding:
                      const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
                  switchToColumn: false,
                  btnStyle: defaultBtnStyle(
                      context,
                      const EdgeInsets.symmetric(
                          horizontal: 100, vertical: 15)),
                )
              ])),
        ),
      ),
    );
  }
}
