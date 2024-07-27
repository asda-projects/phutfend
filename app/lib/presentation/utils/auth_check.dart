import 'package:app/presentation/screen/login/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthCheck extends StatefulWidget {
  final WidgetBuilder builder;

  const AuthCheck({super.key, required this.builder});

  @override
  _AuthCheckState createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        } else if (snapshot.hasError) {
          return const LoginScreen(
            redirectErrorMessage: "An error occurred. Please try again!",
          );
        } else if (!snapshot.hasData || snapshot.data == null) {
          return const LoginScreen(
            redirectErrorMessage: "You must be signed in to continue.",
          );
        } else {
          return widget.builder(context);
        }
      },
    );
  }
}
