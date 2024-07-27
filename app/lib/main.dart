import 'package:app/app.dart';

import 'package:app/settings/environment_variables.dart';
import 'package:app/settings/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';



Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.web);

  if (useEmulator) {
    // Connect to the Firebase Authentication emulator
    
    await FirebaseAuth.instance.useAuthEmulator(emulatorHost, emulatorPort);

    FirebaseFirestore.instance.settings = const Settings(
      host: '$emulatorHost:$firestoreEmulatorPort',
      sslEnabled: false,
      persistenceEnabled: false,
    );
  }
  
  runApp(const App());
}
