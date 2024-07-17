import 'package:app/utils/logs.dart';
import 'package:flutter/material.dart';

import '../widgets/login/login.dart';

localPages(String pageName) {
  var pages = {
    "Login": LoginPage(),
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
