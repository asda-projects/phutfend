
import 'package:app/presentation/boilerplate/assets.dart';
import 'package:app/presentation/boilerplate/body.dart';
import 'package:app/presentation/boilerplate/buttons.dart';
import 'package:app/presentation/boilerplate/text_fields.dart';

import 'package:app/presentation/screen/paths/main_screen.dart';
import 'package:app/presentation/utils/app_bar.dart';

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
        appBar: OverflowAppBar(
          automaticallyImplyLeading: false,
          backgroundColor:  Theme.of(context).colorScheme.onTertiary,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          actions: const [
          Padding(
              padding:  EdgeInsets.only(left: 20),
              child: Text(
                "faLang",
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
        
        ResponsiveContent(body: Column(
                
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   const Center(
                    child: CustomBackgroundImage(
                      assetName: "staff_main_screen.png",
                      alignment: Alignment.topCenter,
                      screenHeight: 400,
                      screenWidth: 600,
                      blurStrength: 0.01,
                      
                      widgets: [],
                    ),
                  ),
                  TranslatableText(
                    "Is not showing any information?",
                    TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  TranslatableText(
                    "Click on add button!",
                    TextStyle(
                      fontSize: 14,
                      fontFamily: "Raleway",
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              )),
              
        childrenWidgets: <Widget>[
          const Expanded(child: SizedBox()),
         IconButton( 
            icon: const Icon(Icons.person), 
            
            onPressed: () {
            navigateToPage(context, 'StaffProfile');
          }),
        ], childrensOverlayEntry: [
              ListTile(
                title:
                    TranslatableText('Manage teachers', defaultTextStyle),
                onTap: () {
                  navigateToPage(context, 'StaffAddTeacher');
                },
              ),
              ListTile(
                title: TranslatableText('Manage students', defaultTextStyle),
                onTap: () {
                  navigateToPage(context, 'StaffAddStudent');
                },
              ),
              ListTile(
                title: TranslatableText('Manage phrases', defaultTextStyle),
                onTap: () {
                  navigateToPage(context, 'StaffAddPhrase');
                },
              ),
            ],);
  }
}

