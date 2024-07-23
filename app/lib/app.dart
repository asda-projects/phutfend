import 'package:app/data/adapters/translation.dart';
import 'package:app/presentation/screen/paths/staff/add_teacher/staff_add_teacher.dart';

import 'package:app/presentation/utils/app_colors.dart';
import 'package:app/settings/logs.dart';

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
// import 'package:app/presentation/screen/paths/staff/main/staff_main_screen.dart';
// import 'package:app/presentation/screen/home/home.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    AppLogger.setGlobalLoggerLevel(Level.ALL);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => LanguageProvider(),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'faLang by WOJO',
            theme: lightTheme, // Default to light theme
            darkTheme: darkTheme, // Dark theme
            themeMode: ThemeMode.system,
            home:  StaffAddTeacherScreen()));
  }
}
