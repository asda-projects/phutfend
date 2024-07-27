import 'package:app/data/adapters/firebase/auth.dart';
import 'package:app/data/adapters/translation.dart';
import 'package:app/domain/services/crud_users.dart';
import 'package:app/presentation/screen/paths/staff/main/staff_main_screen.dart';
import 'package:app/presentation/screen/paths/student/student_main_screen.dart';
import 'package:app/presentation/screen/paths/teacher/teacher_main_screen.dart';





import 'package:app/presentation/utils/app_colors.dart';

import 'package:app/settings/logs.dart';

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

import 'package:app/presentation/screen/home/home.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final AuthUser _authUser = AuthUser();
  final CrudUsers _crudUser = CrudUsers();
  

  @override
  void initState()  {
    super.initState();
    AppLogger.setGlobalLoggerLevel(Level.ALL);
    
  }

  Future<Widget> _getInitialScreen() async {
    bool isLogged = await _authUser.isLogged();

    if (!isLogged) {
      logger.debug("There is no user logged!");
      return HomeScreen();
    }

    AuthResponse customClaimResponse = await _crudUser.fromCustomClaimsCurrentUserGetField("role");
    String rolePosition = customClaimResponse.data as String;

    switch (rolePosition) {
      
      case 'staff':
        logger.debug("There is staff user logged!");
        return const StaffMainScreen();
      case 'student':
        logger.debug("There is student user logged!");
        return const StudentMainScreen();
      case 'teacher':
        logger.debug("There is teacher user logged!");
        return const TeacherMainScreen();
      default:
        logger.debug('Invalid role position: $rolePosition');
        return HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LanguageProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'faLang by WOJO',
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.system,
        home: FutureBuilder<Widget>(
          future: _getInitialScreen(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(body: Center(child: CircularProgressIndicator()));
            } else if (snapshot.hasError) {
              return Scaffold(body: Center(child: Text('Error: ${snapshot.error}')));
            } else {
              return snapshot.data ?? HomeScreen();
            }
          },
        ),
      ),
    );
  }
}
