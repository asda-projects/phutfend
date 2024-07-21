import 'package:app/presentation/boilerplate/assets.dart';
import 'package:app/presentation/boilerplate/buttons.dart';
import 'package:app/presentation/boilerplate/text_fields.dart';

import 'package:app/presentation/screen/paths/main_screen.dart';
import 'package:app/presentation/utils/navigation.dart';
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



    TextStyle defaultTextStyle = TextStyle(
        fontSize: 14,
        fontFamily: "Tahoma",
        color: Theme.of(context).colorScheme.primary,
        );



    return MainScreen(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor:  Theme.of(context).colorScheme.onTertiary,
          actions: const [
          Padding(
              padding:  EdgeInsets.only(left: 20),
              child: Text(
                "ALA App",
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Tahoma",
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )),
           Expanded(child: SizedBox()),
           Padding(
              padding: EdgeInsets.only(right: 20), child: LanguageSelector(iconColor: Colors.white,))
        ]),
        floatingBtnIcon: Icons.add,
        body: 
            SingleChildScrollView(
        child: Column(
              
              mainAxisSize: MainAxisSize.min,
              children: [ 
                const Center(
                  child:  CustomBackgroundImage(
                  assetName: "staff_main_screen.png", 
                  alignment: Alignment.bottomCenter,
                  screenHeight: 400,
                  screenWidth: 600,
                  
                  blurStrength: 0.07,
              widgets: []
                )),
                      TranslatableText( 
                        "Is not showing any information?",
          TextStyle(
              fontSize: 16,
              fontFamily: "Raleway",
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold),
        ),
        TranslatableText( 
                        "Click on Add button!",
          TextStyle(
              fontSize: 14,
              fontFamily: "Raleway",
              color: Theme.of(context).colorScheme.primary,
              
        ))
                      ])),
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
        ], childrensOverlayEntry: [
              ListTile(
                title:
                    TranslatableText('Add teachers', defaultTextStyle),
                onTap: () {
                  navigateToPage(context, 'StaffAddTeacher');
                },
              ),
              ListTile(
                title: TranslatableText('Add students', defaultTextStyle),
                onTap: () {
                  navigateToPage(context, 'StaffAddStudent');
                },
              ),
              ListTile(
                title: TranslatableText('Add phrases', defaultTextStyle),
                onTap: () {
                  navigateToPage(context, 'StaffAddPhrase');
                },
              ),
            ],);
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
