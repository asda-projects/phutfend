import 'package:app/presentation/boilerplate/buttons.dart';
import 'package:app/presentation/utils/auth_check.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final IconData? floatingBtnIcon;
  final List<Widget> childrenWidgets;
  final List<Widget> childrensOverlayEntry;


  const MainScreen({
    super.key,
    this.appBar,
    this.body,
    this.floatingBtnIcon,
    required this.childrenWidgets, 
    required this.childrensOverlayEntry,
  });

  @override
  // ignore: library_private_types_in_public_api
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {

    return AuthCheck(
        builder: (context) => Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.7),
      
      appBar: widget.appBar,
      body: widget.body,
      floatingActionButton:  DropDownFloatingActionButton(
        floatingBtnIcon: widget.floatingBtnIcon, 
        childrensOverlayEntry: widget.childrensOverlayEntry,),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        height: 60,
        color: Theme.of(context).colorScheme.onTertiary,
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: widget.childrenWidgets,
        ),
      ),
    ));
  }
}
