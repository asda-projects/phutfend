// ignore: use_key_in_widget_constructors

import 'package:app/utils/buttons.dart';
import 'package:app/utils/logs.dart';

import 'package:app/widgets/home/preview_top5_stats.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  AppLogger logger = AppLogger();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Color backgroundC = Color.fromARGB(255, 29, 29, 29);

    return Scaffold(
      appBar: AppBar(actions: const [
        Padding(
            padding: const EdgeInsets.only(right: 20),
            child: LanguageSelector())
      ]),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height,
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
          padding: const EdgeInsets.only(top: 1, left: 1, right: 1, bottom: 1),

          child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Top5Players(),
                Container(
                  height: 2,
                  color: Colors.amber,
                ),
                CustomIconAndTextButton(
                  icon: Icons.arrow_forward_ios_sharp,
                  onPressed: () => {logger.debug("test")},
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
