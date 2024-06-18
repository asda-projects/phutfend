


import 'package:app/services/translation.dart';
import 'package:app/widgets/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 

class App extends StatefulWidget {
   const App({super.key});
   
     @override
     State<StatefulWidget> createState() => _AppState();   
}



class _AppState extends State<App> {
  
  @override
  void initState() { super.initState(); }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LanguageProvider(),
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ALA School',
      theme: ThemeData(primaryColor: Colors.white),
      home: HomePage()
      
      ));
  }



}

