


import 'package:animated_background/animated_background.dart';
import 'package:app/presentation/boilerplate/assets.dart';
import 'package:app/presentation/boilerplate/body.dart';
import 'package:app/presentation/boilerplate/buttons.dart';
import 'package:app/presentation/boilerplate/text_fields.dart';
import 'package:app/presentation/utils/navigation.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  OnBoardingScreenState createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen> with TickerProviderStateMixin {



  Widget buildBody(BuildContext context, BoxConstraints constraints) {

      double screenSize = constraints.maxWidth * constraints.maxHeight;


      

      return   SingleChildScrollView(
      
     child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
          buildColumn(constraints, constraints.maxWidth <= 750),
          buildAnimation(
            constraints: constraints,
            child: buildLogo(constraints, constraints.maxWidth >= 750)
          )
      ]));

  }

  Widget buildLogo(BoxConstraints constraints, bool comparision) {
    

    

    double ifColumnSize = constraints.maxWidth <= 750 ? constraints.maxWidth / 3: constraints.maxWidth / 10;

    if (comparision) {
      return Center(
        child: Container(
            
            padding: const EdgeInsets.only(left: 30),
            child:  CustomImage(
              assetName: "faLang-logo.png",
              width: ifColumnSize, // Adjust image size based on screen width
              height: ifColumnSize, // Adjust image size based on screen height

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

  Widget buildAnimation({required Widget child, required BoxConstraints constraints}) {

    double particleCount = ((constraints.maxHeight  * constraints.maxWidth) / (150*150));
    
    return Flexible( 
      
      child: Container(
              height: constraints.maxHeight,
              width: constraints.maxWidth - (constraints.maxWidth / 3.5),
              
              
              //width: Layouts.adjustWidth(context, defaultScreenDivider),
              
          child: AnimatedBackground(
        behaviour: RandomParticleBehaviour(
          options:  ParticleOptions(
            spawnMaxRadius: 50,
            spawnMinSpeed: 10.00,
            particleCount: particleCount.toInt(),
            spawnMaxSpeed: 20,
            minOpacity: 0.3,
            spawnOpacity: 0.4,
            baseColor: Theme.of(context).colorScheme.tertiary,
            // image: Image(image: AssetImage('assets/images/elephant.png')),
          ),
        ),
        vsync: this,
        child: child)));
  }

  Widget buildColumn(BoxConstraints constraints, bool comparision) {

    return Column(
            mainAxisSize: MainAxisSize.max,
            
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
              buildLogo(constraints, comparision),
              buildHeadline(constraints),
              buildDescription(constraints),
              buildButton(constraints)
          ]);

  }


  Widget buildHeadline(BoxConstraints constraints) {

    

    return Container(
              padding:   const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width:  constraints.maxWidth / 1.5,
              child: TranslatableText(
                softWrap: true,
                overflow: TextOverflow.clip,
                "A Learning Management System.\nAn enjoyable place to learn.",
                TextStyle(
                  fontSize: (constraints.maxWidth / 25),
                  fontWeight: FontWeight.bold,
                ),
              ),
            );

  }

  Widget buildDescription(BoxConstraints constraints) {

    

    return Container(
              padding:   const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width:  constraints.maxWidth / 1.5,
              child:  TranslatableText(
                softWrap: true,
                overflow: TextOverflow.clip,
                "Offering a structured and engaging micro-learning process for students with seamless team collaboration."
                "Our system empowers educators to create, manage, and assess personalized learning experiences,"
                "ensuring every student finds joy in their educational journey.",
                TextStyle(
                   fontSize: (constraints.maxWidth / 55),
                  fontWeight: FontWeight.bold,
                ),
              ),
            );

  }

  buildButton(BoxConstraints constraints) {

    double paddingRight = constraints.maxWidth <= 800 ?  constraints.maxWidth / 15 :constraints.maxWidth / 6;

    

    return Container(
              padding:    EdgeInsets.only(left: paddingRight, right: paddingRight, top: 10),
             width:  constraints.maxWidth / 1.5,
              child: CustomIconAndTextButton(
              icon: Icons.arrow_forward_ios_sharp,
              onPressed: () {
                navigateToPage(context, "Login");
              },
              text: "Next",
              padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
              switchToColumn: false,
              addIcon: constraints.maxWidth <= 400 ? false : true,
              txtStyle: TextStyle(fontSize: constraints.maxWidth <= 750 ? 12 : 16),
              btnStyle: defaultBtnStyle(
                context, constraints.maxWidth <= 500 ? EdgeInsets.symmetric(horizontal: 10, vertical: 1)  : EdgeInsets.symmetric(horizontal: 80, vertical: 15)),
            ));
  }


  @override
  Widget build(BuildContext context) {
    
    return LayoutBuilder(
      builder: (context, constraints) {
        return ResponsiveContent(
          body:  buildBody(context, constraints)
            );
            
          });

  }
  }