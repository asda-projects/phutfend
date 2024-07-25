import 'package:animated_background/animated_background.dart';
import 'package:app/presentation/boilerplate/assets.dart';
import 'package:app/presentation/boilerplate/body.dart';
import 'package:app/presentation/boilerplate/buttons.dart';
import 'package:app/presentation/boilerplate/text_fields.dart';
import 'package:app/presentation/utils/layouts.dart';
import 'package:app/presentation/utils/navigation.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  OnBoardingScreenState createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen> with TickerProviderStateMixin {
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    // Determine font sizes based on screen width
    double screenSize = constraints.maxWidth + constraints.maxHeight;
    double headlineFontSize = screenSize * 0.025; // Adjust as necessary
    double descriptionFontSize = screenSize * 0.012; // Adjust as necessary
    double defaultScreenDivider = 0.6;

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            logoBuilder(constraints, screenSize <= 1150),
            Container(
              padding: const EdgeInsets.only(left: 30),
              width: Layouts.adjustWidth(context, defaultScreenDivider),
              child: TranslatableText(
                softWrap: true,
                overflow: TextOverflow.clip,
                "A Learning Management System.\nAn enjoyable place to learn.",
                TextStyle(
                  fontSize: headlineFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 30),
              width: Layouts.adjustWidth(context, defaultScreenDivider),
              child: TranslatableText(
                softWrap: true,
                overflow: TextOverflow.clip,
                "Offering a structured and engaging micro-learning process for students with seamless team collaboration."
                "Our system empowers educators to create, manage, and assess personalized learning experiences,"
                "ensuring every student finds joy in their educational journey.",
                TextStyle(
                  fontSize: descriptionFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            CustomIconAndTextButton(
              icon: Icons.arrow_forward_ios_sharp,
              onPressed: () {
                navigateToPage(context, "Login");
              },
              text: "Login",
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
              switchToColumn: false,
              btnStyle: defaultBtnStyle(
                context,
                const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
              ),
            ),
          ],
        ),
        Flexible(
          child: AnimatedBackground(
        behaviour: RandomParticleBehaviour(
          options:  ParticleOptions(
            spawnMaxRadius: 50,
            spawnMinSpeed: 10.00,
            particleCount: (
              (constraints.maxHeight.toInt() * constraints.maxWidth.toInt()) * 0.00002
              ).toInt(),
            spawnMaxSpeed: 20,
            minOpacity: 0.3,
            spawnOpacity: 0.4,
            baseColor: Theme.of(context).colorScheme.tertiary,
            // image: Image(image: AssetImage('assets/images/elephant.png')),
          ),
        ),
        vsync: this,
        child: logoBuilder(constraints, screenSize >= 1150))),
      ],
    );
  }

  Widget logoBuilder(BoxConstraints constraints, bool comparision) {

    if (comparision) {
      return Center(child: Container(
            padding: const EdgeInsets.all(20),
            child: CustomImage(
              assetName: "faLang-logo.png",
              width: constraints.maxWidth * 0.4, // Adjust image size based on screen width
              height: constraints.maxHeight * 0.2, // Adjust image size based on screen height
              fit: BoxFit.contain, // Ensure image fits within its container
            ),
          ),
        );
    }
    else {
      return Container(
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ResponsiveContent(
          body: buildContent(context, constraints),
        );
      },
    );
  }
}
