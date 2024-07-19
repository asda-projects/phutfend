import 'package:flutter/material.dart';

class TeacherMainScreen extends StatelessWidget {
  const TeacherMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      color: Colors.red,
      width: 200,
      height: 200,
      padding: const EdgeInsets.all(100),
      child: const Text("TeacherMainScreen"),
    ));
  }
}
