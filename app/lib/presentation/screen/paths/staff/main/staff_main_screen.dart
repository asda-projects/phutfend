
import 'package:app/data/adapters/firebase/auth.dart';
import 'package:app/presentation/boilerplate/assets.dart';
import 'package:app/presentation/boilerplate/body.dart';
import 'package:app/presentation/boilerplate/buttons.dart';

import 'package:app/presentation/boilerplate/text_fields.dart';

import 'package:app/presentation/screen/paths/main_screen.dart';


import 'package:app/presentation/utils/navigation.dart';
import 'package:avatar_glow/avatar_glow.dart';

import 'package:flutter/material.dart';




class StaffMainScreen extends StatefulWidget {

  
  const StaffMainScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _StaffMainScreenState createState() => _StaffMainScreenState();
}

class _StaffMainScreenState extends State<StaffMainScreen> {

  final AuthUser _authUser = AuthUser();
  
  Map<String, String> translationsCache = {};
  

  @override
  Widget build(BuildContext context) {


    TextStyle defaultTextStyle = TextStyle(
        fontSize: 14,
        fontFamily: "Tahoma",
        color: Theme.of(context).colorScheme.primary,
        );

    // getCachedTranslation(context, "", translationsCache);

    return MainScreen(

        body: 
        
        ResponsiveContent(body: Column(
                
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   const Center(
                    child: CustomBackgroundImage(
                      assetName: "staff-main-screen.png",
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
              
        childrenWidgets:  <Widget>[
           const Expanded(child: SizedBox()),
           Builder(
      builder: (BuildContext context) {
        return IconButton( onPressed: () => Scaffold.of(context).openDrawer(),
            icon:const Icon(Icons.menu)
            );
            })
         // DropButton(),
        ], 
        childrensOverlayEntry: [
           UserAccountsDrawerHeader(
            accountName: const Text("test"),
            accountEmail: const Text("test@test.com"),

            currentAccountPicture:  AvatarGlow(
          
          startDelay:  const Duration(milliseconds: 750), 
          glowColor: Theme.of(context).colorScheme.tertiary,
          glowCount: 2,
          glowRadiusFactor: 0.27,
          duration: const Duration(milliseconds: 2000), 
          repeat: false, 
          
          child: 
            CircleAvatar(
          backgroundImage:  customAssetImagem("default-user-avatar.png")
          // Para imagens locais, use AssetImage("caminho/para/imagem")
        ),
        
        ),
          ),
           ExpansionTile(
      title: TranslatableText("Users",
      TextStyle(color: Theme.of(context).colorScheme.primary),
      ),
      leading: const Icon(Icons.group),
      children: [
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
              )]),
               const DropLanguages(iconColor: Colors.white,),
              ListTile(
                title:  TranslatableText('Logout', defaultTextStyle),
                leading: const Icon(Icons.logout),
                onTap: () async {
                  navigateToPage(context, "Home");
                  _authUser.logout();
                }
          
              )
            ]);
  }
}

/**
 *         appBar: OverflowAppBar(
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
 */

