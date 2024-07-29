
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
        // fontSize: 14,
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
              radius: 0.5,
          backgroundImage:  customAssetImagem("default-user-avatar.png")
          // Para imagens locais, use AssetImage("caminho/para/imagem")
        ),
        
        ),
          ),
           ExpansionTile(
      title: 
      TranslatableText("Users",
      TextStyle(
        color: Theme.of(context).colorScheme.primary),
      ),
      leading:  Icon(Icons.group, color: Theme.of(context).colorScheme.primary),
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
              )]),
              
              ExpansionTile(
      title: TranslatableText("Class",
      TextStyle(color: Theme.of(context).colorScheme.primary),
      ),
      leading:  Icon(Icons.school, color: Theme.of(context).colorScheme.primary),
      children: [
              ListTile(
                title: TranslatableText('Manage phrases', defaultTextStyle),
                onTap: () {
                  navigateToPage(context, 'StaffAddPhrase');
                },
              )
      ]),
      const DropLanguages(),
  
              ListTile(
                title:  TranslatableText('Logout', defaultTextStyle),
                leading:  Icon(Icons.logout, color: Theme.of(context).colorScheme.primary),
                onTap: () async {
                  navigateToPage(context, "Home");
                  _authUser.logout();
                }
          
              )

            ]);
  }
}
