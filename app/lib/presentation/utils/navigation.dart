import 'package:app/presentation/screen/paths/student/student.dart';
import 'package:app/presentation/screen/paths/teacher/teacher.dart';
import 'package:app/settings/logs.dart';
import 'package:app/presentation/screen/paths/staff/staff_main_screen.dart';
import 'package:flutter/material.dart';

import '../screen/login/login.dart';

localPages(String pageName) {
  var pages = {
    "Login": LoginScreen(),
    "StaffMain": const StaffMainScreen(),
    "StudentMain": const StudentMainScreen(),
    "TeacherMain": const TeacherMainScreen(),
  };
  return pages[pageName];
}

navigateToPage(BuildContext context, String pageName) {
  AppLogger logger = AppLogger();

  if (localPages(pageName) != null) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => localPages(pageName)),
    );
  } else {
    logger.debug("Error: Page '$pageName' not found!");
  }
}

class RefreshProvider with ChangeNotifier {
  void refreshPage() {
    notifyListeners();
  }
}
