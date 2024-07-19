import 'package:flutter/material.dart';

class StaffAddStudentScreen extends StatelessWidget {
  const StaffAddStudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      color: Colors.yellowAccent,
      width: 200,
      height: 200,
      padding: const EdgeInsets.all(100),
      child: const Text("StaffAddStudentScreen"),
    ));
  }
}
