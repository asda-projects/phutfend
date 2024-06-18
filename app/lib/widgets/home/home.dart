// ignore: use_key_in_widget_constructors
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
            child: Container(
              alignment: Alignment.center,
              height: 600,
              //media query
              color: Colors.white,
              padding:
                  const EdgeInsets.only(top: 80, left: 16, right: 16, bottom: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      CustomForm(
          colorContainer: Colors.indigoAccent.withOpacity(0.3),
          height: 270,
          
          formKey: _formKey,
          child: Column(


      
      children: [
        const Padding(padding: EdgeInsets.only(right: 100),
        child:  Text("Enter your email to reset your password.", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        
        CustomTextFormField(
              labelText: "Username", 
              ifIsEmptyReturn: ifIsEmptyReturn.name, 
              onChanged: _onChanged, 
              controller: usernameController,
              keyboardType: TextInputType.name,
              validator: textFormIsNotEmpty),
        const SizedBox(height: 10),
        CustomTextFormField(
              labelText: "Username", 
              ifIsEmptyReturn: ifIsEmptyReturn.password, 
              onChanged: _onChanged, 
              controller: passwordController,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword, 
              validator: textFormIsPassword),



        const Text("Check your spam folder, we will send you an email with a link to reset your password.", 
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black )),
      ])
      )
                    
                    ],
                  ),
            ),
        ),
    );
  }

}