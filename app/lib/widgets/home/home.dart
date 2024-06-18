// ignore: use_key_in_widget_constructors
import 'package:app/utils/buttons.dart';
import 'package:app/utils/forms.dart';
import 'package:app/utils/text_fields.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
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
      body: SingleChildScrollView(

            child:  Container(
              alignment: Alignment.center,
              height: 800,
              //media query
              color: Colors.amber.shade50,
              padding:
                  const EdgeInsets.only(top: 80, left: 1, right: 16, bottom: 16),
                  child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                
                Padding( padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                     mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      CustomForm(
          colorContainer: Colors.grey.shade600.withOpacity(0.0),
          width: 420,

          formKey: _formKey,
          child: Column(  children: [
        const Padding( padding: EdgeInsets.only(bottom: 20),
        child:  Text("Your languague skills into another level.", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        
        CustomTextFormField(
              labelText: "Username", 
              ifIsEmptyReturn: ifIsEmptyReturn.name, 
              onChanged: _onChanged, 
              controller: usernameController,
              keyboardType: TextInputType.name,
              validator: textFormIsNotEmpty),
        const SizedBox(height: 10),
        CustomTextFormField(
              labelText: "Password", 
              ifIsEmptyReturn: ifIsEmptyReturn.password, 
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
        child:  Text("To login is needed to be a student from ALA Language School", 
        style: TextStyle(fontSize: 11, fontWeight: FontWeight.normal, color: Colors.black ))),
      ])
      )
                    
                    ],
                  )),

                  Container(
                  width: 400,
                  height: 500,
                  color: Colors.black,
                ),
                  
                
                  
                  
                  ]),
            ),
        ),
    );
  }

}