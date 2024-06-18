import 'dart:ui' as ui;

import 'package:flutter/material.dart';



class CustomImage extends StatelessWidget {
  final String assetName;
  final double? width;
  final double? height;

  const CustomImage({
    super.key,
    required this.assetName,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) { 
    return Image.asset(
      'assets/images/$assetName',
      width: width,
      height: height,
    );
  }
}



AssetImage customAssetImagem(String assetName) {
    return AssetImage("images/$assetName");

}




class CustomDecorationImage extends BoxDecoration {
  final String assetName;
  final Alignment alignment;
  final BoxFit? fit;

  CustomDecorationImage({
    required this.assetName,
    required this.alignment,
    this.fit,
  }) : super(
         // Aqui você pode passar parâmetros para o construtor de BoxDecoration,
         // como uma imagem de fundo.
         image: DecorationImage(
           image: customAssetImagem(assetName),
           alignment: alignment,
           filterQuality: FilterQuality.high,
           fit: fit
           

         ),
       );
}


class CustomBackgroundImage extends StatelessWidget {
  final String assetName;
  final Alignment alignment;
  final double? screenWidth;
  final double? screenHeight;
  final List<Widget>? widgets;
  final double blurStrength;
  final bool staticImgSize;
  final BoxFit? fit;
  final dynamic stackFit;

  const CustomBackgroundImage({
    super.key,
    required this.assetName,
    required this.alignment,
    this.screenWidth,
    this.screenHeight,
    this.widgets,
    this.fit,
    this.stackFit = StackFit.loose,
    this.blurStrength = 5.0,
    this.staticImgSize = true

  });

  @override

  Widget build(BuildContext context) {

      List<Widget> defaultList = [
      Container(
      width: staticImgSize ? 700 : screenWidth,
      height: staticImgSize ? 700: screenHeight,
        decoration: CustomDecorationImage(
          assetName:assetName, alignment:alignment, fit: fit),
      ),
      Positioned.fill(
        child: BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: blurStrength, sigmaY: blurStrength),
          child: Container(
            color: Colors.transparent,
          ),
        ),
      )
    ];

  List<Widget> fullList;


  if (widgets != null) {
    fullList = defaultList + widgets!;
  } else {
    fullList = defaultList;
    
  }

    return Stack(
      fit: stackFit,
      alignment: Alignment.center,
      children: fullList,
    );
  }
}