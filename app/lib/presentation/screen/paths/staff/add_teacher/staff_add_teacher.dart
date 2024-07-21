import 'package:app/presentation/boilerplate/buttons.dart';
import 'package:app/presentation/utils/app_bar.dart';
import 'package:flutter/material.dart';

class StaffAddTeacherScreen extends StatelessWidget {
  const StaffAddTeacherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: OverflowAppBar(actions: const [
           Padding(
              padding: EdgeInsets.only(right: 20), child: LanguageSelector())
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        )
        ),
      body:Center(
        child: Container(
      color: Colors.purple,
      width: 200,
      height: 200,
      padding: const EdgeInsets.all(100),
      child: const Text("StaffAddTeacherScreen"),
    )));
  }
}
