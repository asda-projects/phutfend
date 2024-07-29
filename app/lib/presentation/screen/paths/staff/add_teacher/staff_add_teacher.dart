import 'package:app/domain/services/crud_users.dart';
import 'package:app/presentation/boilerplate/buttons.dart';
import 'package:app/presentation/boilerplate/text_fields.dart';
import 'package:app/presentation/screen/paths/staff/add_teacher/body_narrow.dart';
import 'package:app/presentation/screen/paths/staff/add_teacher/body_wide.dart';
import 'package:app/presentation/utils/app_bar.dart';
import 'package:app/settings/logs.dart';

import 'package:flutter/material.dart';


// ignore: must_be_immutable
class StaffAddTeacherScreen extends StatelessWidget {
  CrudUsers crud = CrudUsers(user: null);
  AppLogger logger = AppLogger();
  
  StaffAddTeacherScreen({super.key});


  Widget buildScreen(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width;
    
    if (widthSize >= 750) {return const AddTeacherBodyWide(); }
    else {return const AddTeacherBodyNarrow(); }

  }

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
      body: buildScreen(context)
      ));
  }
}
