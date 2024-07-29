import 'package:app/domain/services/crud_users.dart';
import 'package:app/presentation/boilerplate/buttons.dart';
import 'package:app/presentation/boilerplate/text_fields.dart';
import 'package:app/presentation/screen/paths/staff/add_teacher/body_wide.dart';
import 'package:app/presentation/utils/app_bar.dart';
import 'package:app/settings/logs.dart';

import 'package:flutter/material.dart';


// ignore: must_be_immutable
class StaffAddTeacherScreen extends StatelessWidget {
  CrudUsers crud = CrudUsers(user: null);
  AppLogger logger = AppLogger();
  
  StaffAddTeacherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
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
            boxTextHint: "Search a user...",
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
      body: const AddTeacherBodyWide()
      ));
  }
}

/**
 * 
 * TabBarView(
          children:[ 
            Center(
        child: Container(
      color: Colors.purple,
      width: 200,
      height: 200,
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
      child: const Text("StaffAddTeacherScreen 1"),
    )), Center(
        child: Container(
      color: Colors.purple,
      width: 200,
      height: 200,
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
      child: const Text("StaffAddTeacherScreen 2"),
    )), 
    Center(
        child: Container(
      color: Colors.purple,
      width: 200,
      height: 200,
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
      child: const Text("StaffAddTeacherScreen 3"),
    ))]))
 * 
 * 
 *         bottom:  TabBar(
          
            dividerColor: Theme.of(context).scaffoldBackgroundColor,
            
            tabs:  [
              Icon(Icons.add_reaction_rounded, color:  Theme.of(context).colorScheme.primary),

              
              Icon(Icons.person_remove_alt_1_rounded, color:  Theme.of(context).colorScheme.primary),

              Padding(padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:[
                    Icon(Icons.assignment_add, color:  Theme.of(context).colorScheme.primary),
                    
                    const TranslatableText("Add", TextStyle(fontSize: 12))
                    ])),
              

            ],
          )
 */
