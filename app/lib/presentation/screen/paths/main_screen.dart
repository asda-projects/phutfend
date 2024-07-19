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
      appBar: widget.appBar,
      body: widget.body,
      floatingActionButton:  DropDownFloatingActionButton(
        floatingBtnIcon: widget.floatingBtnIcon, 
        childrensOverlayEntry: widget.childrensOverlayEntry,),
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

/**
 * [
              ListTile(
                title:
                    TranslatableText('Adicionar Professor', defaultTextStyle),
                onTap: () {
                  navigateToPage(context, 'StaffAddTeacher');
                },
              ),
              ListTile(
                title: TranslatableText('Adicionar Aluno', defaultTextStyle),
                onTap: () {
                  navigateToPage(context, 'StaffAddStudent');
                },
              ),
              ListTile(
                title: TranslatableText('Adicionar Frase', defaultTextStyle),
                onTap: () {
                  navigateToPage(context, 'StaffAddPhrase');
                },
              ),
            ]
 */