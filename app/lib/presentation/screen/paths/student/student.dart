import 'package:flutter/material.dart';

class StudentMainScreen extends StatelessWidget {
  const StudentMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      color: Colors.blue,
      width: 200,
      height: 200,
      padding: const EdgeInsets.all(100),
      child: const Text("StudentMainScreen"),
    ));
  }
}
