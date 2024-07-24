import 'package:app/presentation/screen/paths/staff/add_phrase/staff_add_phrase.dart';
import 'package:app/presentation/screen/paths/staff/add_student/staff_add_student.dart';
import 'package:app/presentation/screen/paths/staff/add_teacher/staff_add_teacher.dart';
import 'package:app/presentation/screen/paths/staff/staff_profile.dart';
import 'package:app/presentation/screen/paths/student/student_main_screen.dart';
import 'package:app/presentation/screen/paths/teacher/teacher_main_screen.dart';
import 'package:app/settings/logs.dart';
import 'package:app/presentation/screen/paths/staff/main/staff_main_screen.dart';
import 'package:flutter/material.dart';

import '../screen/login/login.dart';

localPages(String pageName) {
  var pages = {
    "Login": const LoginScreen(),
    "StaffMain": const StaffMainScreen(),
    "StudentMain": const StudentMainScreen(),
    "TeacherMain": const TeacherMainScreen(),
    "StaffAddStudent": const StaffAddStudentScreen(),
    "StaffAddTeacher":  StaffAddTeacherScreen(),
    "StaffAddPhrase": const StaffAddPhraseScreen(),
    "StaffProfile": StaffProfileScreen()
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
