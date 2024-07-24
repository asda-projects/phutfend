import 'package:app/presentation/boilerplate/buttons.dart';
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

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.7),
      
      appBar: widget.appBar,
      body: widget.body,
      floatingActionButton:  DropDownFloatingActionButton(
        floatingBtnIcon: widget.floatingBtnIcon, 
        childrensOverlayEntry: widget.childrensOverlayEntry,),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).colorScheme.onTertiary,
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
