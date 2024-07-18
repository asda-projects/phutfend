import 'package:flutter/material.dart';

class StaffMainScreen extends StatelessWidget {
  const StaffMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      color: Colors.green,
      width: 200,
      height: 200,
      padding: const EdgeInsets.all(100),
      child: const Text("StaffMainScreen"),
    ));
  }
}
