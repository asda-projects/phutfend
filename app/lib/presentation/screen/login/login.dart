import 'package:animated_background/animated_background.dart';
import 'package:app/data/adapters/translation.dart';
import 'package:app/domain/services/login_screen_deliver.dart';
import 'package:app/presentation/boilerplate/buttons.dart';
import 'package:app/presentation/utils/app_bar.dart';
import 'package:app/presentation/utils/layouts.dart';

import 'package:app/presentation/boilerplate/text_fields.dart';

import 'package:app/presentation/utils/validation.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {

  final String? redirectErrorMessage;


  const LoginScreen({super.key, this.redirectErrorMessage});

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
    if (widget.redirectErrorMessage != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            
            content: TranslatableText(
              widget.redirectErrorMessage!,
               TextStyle(
                color: Theme.of(context).colorScheme.onTertiary,
                fontSize: 14,
                fontWeight: FontWeight.bold
                ),
              )
            ),
        );
      });
    }

    return Scaffold(
        appBar: OverflowAppBar(
          automaticallyImplyLeading: widget.redirectErrorMessage != null ? false : true,
          actions: const [
           Expanded(child: SizedBox()),
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
