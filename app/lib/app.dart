import 'package:app/services/translation.dart';
import 'package:app/utils/app_colors.dart';
import 'package:app/utils/logs.dart';
import 'package:app/widgets/home/home.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

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
            title: 'ALA School',
            theme: lightTheme, // Default to light theme
            darkTheme: darkTheme, // Dark theme
            themeMode: ThemeMode.system,
            home: HomePage()));
  }
}
