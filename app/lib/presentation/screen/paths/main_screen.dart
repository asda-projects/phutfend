import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final IconData? floatingBtnIcon;
  final void Function()? floatingBtnOnPressed;
  final List<Widget> childrenWidgets;

  const MainScreen({
    super.key,
    this.appBar,
    this.body,
    this.floatingBtnIcon,
    required this.floatingBtnOnPressed,
    required this.childrenWidgets,
  });

  @override
  // ignore: library_private_types_in_public_api
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar,
      body: widget.body,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(eccentricity: 0.3),
        onPressed: widget.floatingBtnOnPressed,
        child: Icon(widget.floatingBtnIcon),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: widget.childrenWidgets,
        ),
      ),
    );
  }
}
