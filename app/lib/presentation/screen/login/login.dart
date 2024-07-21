import 'package:animated_background/animated_background.dart';
import 'package:app/domain/services/login_screen_deliver.dart';
import 'package:app/presentation/boilerplate/buttons.dart';
import 'package:app/presentation/utils/app_bar.dart';
import 'package:app/presentation/utils/layouts.dart';

import 'package:app/presentation/boilerplate/text_fields.dart';

import 'package:app/presentation/utils/validation.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {


  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>  with TickerProviderStateMixin {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  


  @override
  Widget build(BuildContext context) {
    double heightLayout =  Layouts.adjustHeight(context, 1);
    double widthLayout =  Layouts.adjustWidth(context, 1);
    return Scaffold(
        appBar: const OverflowAppBar(actions: [
          Padding(
              padding: EdgeInsets.only(right: 20),
              child: LanguageSelector(reloadPage: true, pageName: "Login"))
        ]),
        body: AnimatedBackground(
        behaviour: RandomParticleBehaviour(
          options:  ParticleOptions(
            spawnMaxRadius: 50,
            spawnMinSpeed: 10.00,
            particleCount: (
              (heightLayout.toInt() * widthLayout.toInt()) * 0.00002
              ).toInt(),
            spawnMaxSpeed: 20,
            minOpacity: 0.3,
            spawnOpacity: 0.4,
            baseColor: Theme.of(context).colorScheme.tertiary,
            // image: Image(image: AssetImage('assets/images/elephant.png')),
          ),
        ),
        vsync: this,
        child: SingleChildScrollView(
            child: Container(
                alignment: Alignment.topCenter,
                height: heightLayout,
                //media query
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 190),
                  child: Container(
                    width: 270,
                    alignment: Alignment.topCenter,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomTextFormField(
                          labelText: 'Email',
                          ifIsEmptyReturn: IfIsEmptyReturn.email,
                          onChanged: (value) {},
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: textFormIsEmail,
                        ),
                        CustomTextFormField(
                          labelText: 'Password',
                          ifIsEmptyReturn: IfIsEmptyReturn.password,
                          onChanged: (value) {},
                          controller: passwordController,
                          obscureText: true,
                          validator: textFormIsPassword,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        CustomIconAndTextButton(
                          icon: Icons.arrow_forward_ios_sharp,
                          onPressed: () {
                            LoginScreenDeliver(emailController.text,
                                    passwordController.text)
                                .deliverScreen(context);
                          },
                          text: "Confirmar",
                          padding: const EdgeInsets.symmetric(
                              horizontal: 2, vertical: 3),
                          switchToColumn: false,
                          btnStyle: defaultBtnStyle(
                              context,
                              const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15)),
                        )
                      ],
                    ),
                  ),
                )))));
  }
}

/**
 * CustomForm(
        colorContainer: Colors.grey.shade600.withOpacity(0.0),
        width: 500,
        formKey: _formKey,
        child: Column(children: [
          const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: TranslatableText(
                  "Your languague skills into another level.",
                  TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
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
            onPressed: _isButtonDisabled ? null : () => {},
            text: "Login",
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
            switchToColumn: false,
            btnStyle: defaultBtnStyle(context,
                const EdgeInsets.symmetric(horizontal: 125, vertical: 20)),
          ),
          const SizedBox(height: 60),
          const Padding(
              padding: EdgeInsets.only(top: 1),
              child: TranslatableText(
                  "To login, is needed to be a student from ALA Language School",
                  TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.normal,
                      color: Colors.black))),
          const SizedBox(height: 4),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomIconAndTextButton(
                icon: Icons.public,
                iconColor: Colors.black,
                onPressed: () => {},
                addText: false,
                text: "",
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                switchToColumn: false,
                btnStyle: TextButton.styleFrom(
                  disabledForegroundColor: Colors.grey.withOpacity(0.38),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              CustomIconAndTextButton(
                icon: Icons.facebook,
                iconColor: Colors.blue.shade900,
                onPressed: () => {},
                addText: false,
                text: "",
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                switchToColumn: false,
                btnStyle: TextButton.styleFrom(
                  disabledForegroundColor: Colors.grey.withOpacity(0.38),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              CustomIconAndTextButton(
                icon: Icons.camera_alt_outlined,
                iconColor: Colors.pink.shade300,
                onPressed: () => {},
                addText: false,
                text: "",
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                switchToColumn: false,
                btnStyle: TextButton.styleFrom(
                  disabledForegroundColor: Colors.grey.withOpacity(0.38),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              CustomIconAndTextButton(
                icon: Icons.live_tv_sharp,
                iconColor: Colors.red.shade900,
                onPressed: () => {},
                addText: false,
                text: "",
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                switchToColumn: false,
                btnStyle: TextButton.styleFrom(
                  disabledForegroundColor: Colors.grey.withOpacity(0.38),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              CustomIconAndTextButton(
                icon: Icons.forum_rounded,
                iconColor: Colors.greenAccent.shade400,
                onPressed: () => {},
                addText: false,
                text: "",
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                switchToColumn: false,
                btnStyle: TextButton.styleFrom(
                  disabledForegroundColor: Colors.grey.withOpacity(0.38),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              )
            ],
          )
        ]))




        Container(
                  width: 300,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4), // Adjust the width as needed
                  child: TranslatableText(
                    "feito para fazer lição de casa e treinar suas habilidades!",
                    TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).colorScheme.primary,
                      fontFamily: 'Tahoma',
                    ),
                    softWrap: true,
                    overflow: TextOverflow.clip,
                  ),
                ),
 */