import 'package:flutter/material.dart';

import '../widgets/login/login.dart';

localPages(String pageName) {
  var pages = {
    "Login": const LoginPage(),
  };
  return pages[pageName];
}

navigateToPage(BuildContext context, String pageName) {
  if (localPages(pageName) != null) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => localPages(pageName)),
    );
  } else {
    print("Error: Page '$pageName' not found!");
  }
}
