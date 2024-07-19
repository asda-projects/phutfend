import 'package:app/presentation/boilerplate/buttons.dart';
import 'package:app/presentation/boilerplate/text_fields.dart';

import 'package:app/presentation/screen/paths/main_screen.dart';
import 'package:flutter/material.dart';

class StaffMainScreen extends StatefulWidget {
  const StaffMainScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _StaffMainScreenState createState() => _StaffMainScreenState();
}

class _StaffMainScreenState extends State<StaffMainScreen> {
  @override
  Widget build(BuildContext context) {
    return MainScreen(
        appBar: AppBar(actions: [
          Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "ALA App",
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Tahoma",
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold),
              )),
          const Expanded(child: SizedBox()),
          const Padding(
              padding: EdgeInsets.only(right: 20), child: LanguageSelector())
        ]),
        floatingBtnIcon: Icons.add,
        floatingBtnOnPressed: () {
          // Add your onPressed code here!
        },
        body: Center(
            child: TranslatableText(
          "Content goes here!",
          TextStyle(
              fontSize: 16,
              fontFamily: "Tahoma",
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold),
        )),
        childrenWidgets: <Widget>[
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // Add your onPressed code here!
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Add your onPressed code here!
            },
          ),
        ]);
  }
}


/**
 * Scaffold(
      appBar: AppBar(actions: const [
        Padding(padding: EdgeInsets.only(right: 20), child: LanguageSelector())
      ]),
      body: const Center(
        child: TranslatableText('Content goes here', TextStyle(fontSize: 16)),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(eccentricity: 0.3),
        onPressed: () {
          // Add your onPressed code here!
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                // Add your onPressed code here!
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                // Add your onPressed code here!
              },
            ),
          ],
        ),
      ),
    );
 */
