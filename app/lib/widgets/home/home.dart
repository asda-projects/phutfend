// ignore: use_key_in_widget_constructors

import 'package:app/utils/assets.dart';
import 'package:app/utils/buttons.dart';
import 'package:app/utils/forms.dart';
import 'package:app/utils/text_fields.dart';
import 'package:app/widgets/home/preview_top10_stats.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
  


}

class _HomePageState extends State<HomePage> {
  
  final _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  

  // ignore: unused_field
  bool _isButtonDisabled = true;
  


    void _onChanged(dynamic value) {

    if (_formKey.currentState?.validate() == true) {
      setState(() => _isButtonDisabled = false);
    } else {
      setState(() => _isButtonDisabled = true);
    }
  }



  
  @override
  Widget build(BuildContext context) {



     return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(180, 255, 255, 207),
        actions: const [
        Padding( padding: const EdgeInsets.only(right: 20),
              child: LanguageSelector())

      ]),
      body: SingleChildScrollView(

            child:  Container(
              alignment: Alignment.center,
              height: 800,
              //media query
              decoration:  const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color.fromARGB(168, 255, 255, 207), Colors.white, Colors.white ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
         
        )),
              padding:
                  const EdgeInsets.only(top: 80, left: 1, right: 16, bottom: 16),
                  child: SingleChildScrollView( 
                    scrollDirection: Axis.horizontal,
                    child: 
        
        Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                
                Padding( padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                     mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      CustomForm(
          colorContainer: Colors.grey.shade600.withOpacity(0.0),
          width: 500,

          formKey: _formKey,
          child: Column(  children: [
        const Padding( padding: EdgeInsets.only(bottom: 20),
        child:  TranslatableText("Your languague skills into another level.",  TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        
        CustomTextFormField(
              labelText: "Username", 
              ifIsEmptyReturn: IfIsEmptyReturn.name, 
              onChanged: _onChanged, 
              controller: usernameController,
              keyboardType: TextInputType.name,
              validator: textFormIsNotEmpty),
        const SizedBox(height: 10),
        CustomTextFormField(
              labelText: "Password", 
              ifIsEmptyReturn: IfIsEmptyReturn.password, 
              onChanged: _onChanged, 
              controller: passwordController,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword, 
              validator: textFormIsPassword),
        
        const SizedBox(height: 30),
        CustomIconAndTextButton(
            icon: Icons.arrow_forward_ios_sharp, 
            onPressed:  _isButtonDisabled ? null : () => {},
            text: "Login", 
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
            switchToColumn: false,
            
            btnStyle: defaultBtnStyle(context, const EdgeInsets.symmetric(horizontal: 125, vertical: 20)),
            ),

        const SizedBox(height: 60),
        const Padding( padding: EdgeInsets.only(top: 1),
        child:  TranslatableText("To login, is needed to be a student from ALA Language School", 
        TextStyle(fontSize: 11, fontWeight: FontWeight.normal, color: Colors.black ))),
         const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              CustomIconAndTextButton(
            icon: Icons.public , 
            iconColor: Colors.black,
            onPressed:  () => {},
            addText: false,
            text: "", 
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
            switchToColumn: false,
            
            btnStyle:  TextButton.styleFrom(
            
            
            disabledForegroundColor: Colors.grey.withOpacity(0.38),
            
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
),
            ),
                CustomIconAndTextButton(
            icon: Icons.facebook , 
            iconColor: Colors.blue.shade900,
            onPressed:  () => {},
            addText: false,
            text: "", 
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
            switchToColumn: false,
            
            btnStyle:  TextButton.styleFrom(
            
            
            disabledForegroundColor: Colors.grey.withOpacity(0.38),
            
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
),
            )
            ,
                CustomIconAndTextButton(
            icon: Icons.camera_alt_outlined , 
            iconColor: Colors.pink.shade300,
            onPressed:  () => {},
            addText: false,
            text: "", 
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
            switchToColumn: false,
            
            btnStyle:  TextButton.styleFrom(
            
            
            disabledForegroundColor: Colors.grey.withOpacity(0.38),
            
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
),
            )
            ,
                CustomIconAndTextButton(
            icon: Icons.live_tv_sharp , 
            iconColor: Colors.red.shade900,
            onPressed:  () => {},
            addText: false,
            text: "", 
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
            switchToColumn: false,
            
            btnStyle:  TextButton.styleFrom(
            
            
            disabledForegroundColor: Colors.grey.withOpacity(0.38),
            
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
),
            ),
                CustomIconAndTextButton(
            icon: Icons.forum_rounded ,
            iconColor: Colors.greenAccent.shade400,
            onPressed:  () => {},
            addText: false,
            text: "", 
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
            switchToColumn: false,
            
            btnStyle:  TextButton.styleFrom(
            
            
            disabledForegroundColor: Colors.grey.withOpacity(0.38),
            
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
),
            )



        ],)
      ])
      )
                    
                    ],
                  )),

                 Container(
                  width: 210,
                  decoration:  CustomDecorationImage(
              alignment: Alignment.bottomCenter,
              assetName: "elephant.png",
              fit: BoxFit.none
              ),
                 ),

                  Top10Players(),
                  
                
                  
                  
                  ])
                  ),
            ),
        ),
    );
  }

}