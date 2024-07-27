import 'package:app/data/adapters/firebase/auth.dart';

import 'package:app/presentation/boilerplate/buttons.dart';
import 'package:app/presentation/screen/home/home.dart';
import 'package:app/settings/logs.dart';

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
  final AuthUser _authUser = AuthUser();
  AppLogger logger = AppLogger();

  Future<bool> _checkLoginStatus() async {
    bool isLogged = await _authUser.isLogged();
    return isLogged;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _checkLoginStatus(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // While waiting for the future to complete, show a loading spinner
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          // If the future encountered an error, show an error message
          logger.debug("Error checking login status: ${snapshot.error}");
          return HomeScreen();
        } else {
          bool isLogged = snapshot.data ?? false;
          if (!isLogged) {
            logger.debug("There is no user logged!");
            return HomeScreen();
          } else {
            var themeOfContext = Theme.of(context);
            return Scaffold(
              backgroundColor: themeOfContext.scaffoldBackgroundColor.withOpacity(0.7),
              // appBar: widget.appBar,
              body: widget.body,
              bottomNavigationBar: BottomAppBar(
                height: 60,
                color: themeOfContext.colorScheme.onTertiary,
                shape: const CircularNotchedRectangle(),
                notchMargin: 6.0,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: widget.childrenWidgets,
                ),
              ),
              drawer: CustomDrawer(
                tiles: 
              widget.childrensOverlayEntry
              ),
            );
          }
        }
      },
    );
  }
}
/**
 * bottomNavigationBar: BottomAppBar(
                height: 60,
                color: themeOfContext.colorScheme.onTertiary,
                shape: const CircularNotchedRectangle(),
                notchMargin: 6.0,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: widget.childrenWidgets,
                ),
              ),
 */